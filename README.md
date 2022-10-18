![image](https://user-images.githubusercontent.com/105120795/195488866-ab7d99e5-7ffe-455d-8a6e-cabae3f55110.png)
# END GAME RACE HEAT CLASSIFICATION

Project by:<br>
[Ken Rigaud](https://github.com/KenRigaud)<br>
[Pablo Milanese](https://github.com/pablomilanese)<br>
[Miranda Jimenez](https://github.com/mirj1209)<br> 
[Keeron Willis](https://github.com/Keeron12)<br>

Roles:
Ken Rigaud: Triangle-role
Pablo Milanese: Square-role
Miranda Jimenez: X-role
Keeron Willis: Circle-role

## Overview
The purpose of this project is to group cars by multiple variables in order to race together in a fair way. Although it may seem obvious that a Bugatti and a Honda Civic cannot reasonably compete, the line gets blurred when we start to consider cars that have similar specs but differ in others. We chose this topic because of a mutual interest in cars. Although not every car is built with the purpose of racing, it is the best way to put their performance to the test. To quote gymnastics coach Béla Károlyi, "no competition, no progress".

The presentation can be found [here](https://docs.google.com/presentation/d/1B7tiqK9pZ7de9wioay8c8njbmgje4rB_3YPLMKv_FNg/edit#slide=id.g16609582bcc_0_195) and the dashboard can be found [here](https://public.tableau.com/app/profile/miranda.jimenez/viz/RacingFinalTableauStory_/Racing?publish=yes).

## Source of Data
After considering different datasets on Kaggle we decided to use [this one](https://www.kaggle.com/datasets/CooperUnion/cardataset) because it included a 11,914 unique cars with multiple variables. These variables include engine fuel type, engine horsepower, cylinders, transmission, driven wheels, number of doors, market category, wehicle size, highway MPG, city MPG, popurality and MSRP. It was crucial for this project that we worked with a large dataset to display how our classification model groups cars when multiple variables are considered. Our dataset was initially split 

## Technology & Tools
To code our classification model and process our data we used python's `pandas`, `Scikit-learn`, `plotly` and `matplotlib` libraries on jupyter notebook.<br>
To import our initial database into the model and store our results we used `AWS`'s cloud storage as well as python's `psycopg2` driver and `sqlalchemy` library to connect our code to `postgres`. Our ERD can be found [here](https://github.com/pablomilanese/final-project/blob/main/fuelsystem_schema.sql).<br>
To present our project we used `google slides` for our presentation and `tableau` for our dashboard.

## Analysis phase of the project

#### DATA EXPLORATION
Our first step was to identify how many null values and what object types we were working with. We found the following:

|	#	|	Column	|	Non-Null Count	|	Dtype	|
|	:-------------	|	:-------------	|	:-------------	|	:-------------	|
|	0	|	Make	|	11914 non-null	|	object	|
|	1	|	Model	|	11914 non-null	|	object	|
|	2	|	Year	|	11914 non-null	|	int64	|
|	3	|	Engine Fuel Type	|	11911 non-null	|	object	|
|	4	|	Engine HP	|	11845 non-null	|	float64	|
|	5	|	Engine Cylinders	|	11884 non-null	|	float64	|
|	6	|	Transmission Type	|	11914 non-null	|	object	|
|	7	|	Driven Wheels	|	11914 non-null	|	object	|
|	8	|	Number of Doors	|	11908 non-null	|	float64	|
|	9	|	Market Category	|	8172 non-null	|	object	|
|	10	|	Vehicle size	|	11914 non-null	|	object	|
|	11	|	Vehicle Style	|	11914 non-null	|	object	|
|	12	|	Highway MPG	|	11914 non-null	|	int64	|
|	13	|	City MPG	|	11914 non-null	|	int64	|
|	14	|	Popularity	|	11914 non-null	|	int64	|
|	15	|	MSRP	|	11914 non-null	|	int64	|

We proceeded to drop the columns that we did not deem useful for our model as well as Market Category, given that it had the largest amount of null values and would dimish the size of our dataset.

Afterwards we dropped all the null rows from the remaining columns to ensure we had a full dataset to work with and deleted the duplicates.

|	#	|	Column	|	Non-Null Count	|	Dtype	|
|	:-------------	|	:-------------	|	:-------------	|	:-------------	|
|	0	|	Make	|	6376 non-null	|	object	|
|	1	|	Model	|	6376 non-null	|	object	|
|	2	|	Year	|	6376 non-null	|	int64	|
|	3	|	Engine Fuel Type	|	6376 non-null	|	object	|
|	4	|	Engine HP	|	6376 non-null	|	float64	|
|	5	|	Engine Cylinders	|	6376 non-null	|	float64	|
|	6	|	Transmission Type	|	6376 non-null	|	object	|
|	7	|	Driven Wheels	|	6376 non-null	|	object	|
|	10	|	Vehicle size	|	6376 non-null	|	object	|
|	11	|	Vehicle Style	|	6376 non-null	|	object	|
|	12	|	Highway MPG	|	6376 non-null	|	int64	|

#### DATA ANALYSIS
Before we could proceed with our model we determined that we had to convert year, transmission type, wheel drive, vehicle size and vehicle style from non-numerical data to integers. For example, this is how we converted vehicle size:

```
new_carData_df['Vehicle Size'][new_carData_df['Vehicle Size'] == 'Compact'] = 1
new_carData_df['Vehicle Size'][new_carData_df['Vehicle Size'] == 'Midsize'] = 2
new_carData_df['Vehicle Size'][new_carData_df['Vehicle Size'] == 'Large'] = 3
```
Assigning a numerical value to these variables allows us to take advantage of this information.

Although some categorizing proved a bit more manual such as vehicle style (example below), we were able to consider this information instead of having to drop the column completely.

```
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Coupe'] = 1
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Convertible'] = 2
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Sedan'] = 3
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Wagon'] = 4
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == '4dr Hatchback'] = 5
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == '2dr Hatchback'] = 6
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == '4dr SUV'] = 7
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Passenger Minivan'] = 8
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Cargo Minivan'] = 9
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Crew Cab Pickup'] = 10
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Regular Cab Pickup'] = 11
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Extended Cab Pickup'] = 12
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == '2dr SUV'] = 13
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Cargo Van'] = 14
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Convertible SUV'] = 15
new_carData_df['Vehicle Style'][new_carData_df['Vehicle Style'] == 'Passenger Van'] = 16
```
Once all of our variables were transformed into integers our table became easier to work with.

<img width="704" alt="image" src="https://user-images.githubusercontent.com/105120795/195468697-a2fc721c-c51d-4885-b618-fef374dccd22.png">

## Data Processing

#### MODEL CHOICE<br>
K-means clustering is an unsupervised learning algorithm that classifies a dataset into a number of clusters. A cluster is a collection of data points grouped together because of certain similarities. This was an ideal algorithm because our goal with this project was to group cars with multiple variables into four categories.

##### BENEFITS<br>
The main benefits that attracted us to K-means is that it scales to large data sets and helps create convergence. Because our goal was to classify cars with different variables into four groups, we found the K-means model to be the best option for this task.

##### LIMITATIONS<br>
The biggest limitations of clustering models occurs when the data is of varying size and density. Specifically, outliers may drag information from the center, making the model less accurate. In our case we had two outliers that did not skew our data. Although another limitation is that when we scale with number of dimensions there can be an increase in distance, we can correct this by using PCA (principal component analysis) to modify the clustering algorithm. <br>


#### CHANGES IN MODEL CHOICE<br>
Although we were set on building a model that would apply to the automobile world, we changed the course of our project after our second deliverable. In the beginning our goal was to create a model that would help engineers predict what would be the best fuel system for a specific car. After many trial and error runs and researching how engines work, we realized that our model could not accomplish what we wanted to. Because we sill wanted to create a model that would be related to automobiles we decided that it would be interesting to see if it was possible to group cars with different variables to the best of the model's abilities.

## Conclusion
After running our model the cars were grouped in the following clusters:<br>

|	#	|	Cluster Name	|	Cluster Trends	|	Examples	|
|	:-------------	|	:-------------	|	:-------------	|	:-------------	|
|	1	|	The Wheenie Hut	|	Newer cars, low HP, auto transmission	|	Wagons, Sedans and Coupes	|
|	2	|	The Civilians	|	Largest group, mid HP, mixed ages	|	Trucks, Vans and SUVs	|
|	3	|	The Oldtimers	|	Oldest cars, low HP, manual transmission	|	Coupes	|
|	4	|	The Speed Demons |	Highest horsepower |	Sedans, Coupes and Sport Cars	|

To get a better grasp of the clusters we did a 3D Scatter plot with the PCA data:<br>

<img width="815" alt="Screen Shot 2022-10-12 at 9 20 29 PM" src="https://user-images.githubusercontent.com/105120795/195483822-dc1c8159-a732-4ddc-89e1-f44fe288e2ac.png">

> Front and back look at the 3D scatter plot

The 3D plot illustrates:<br>
* the four clusters as well as car size within each cluster.<br>
* Sizes include compact, midsize and large.
* The axis of the scatter plot include horsepower, age and style (coupe, convertible, wagon, sedan, etc).<br>

<img width="816" alt="Screen Shot 2022-10-12 at 9 18 45 PM" src="https://user-images.githubusercontent.com/105120795/195483589-07d1cdbf-3179-4891-b406-5023d56d19d7.png">

## Results
Although our model seems to prioritize horse power, there are other variables that go into play such as the year the car was made. For example, both 'Oldtimers' and 'Wheenie Huts' have trend towards low horsepower but they were not clustered together. In the same manner, both Bugatti Veyron's are classified as coupes but clustered with the 'Speed Demons' while a Cadillac CTS is considered 'Wheenie Hut'. We find that our model effectively takes in cars with multiple variables and clusters them together in an appropiate manner.

**OUTLIERS**<br>
Although the scatter plot shows that both Bugatti Veyrons from the dataset appear to be outliers, they were clustered together with other cars such as Lamborghini's and Dodge Chargers. If the dataset included other cars with exponential horsepower such as McLarens and Koenigseggs (both brands that build cars with +1,000 HP) it would be appropiate to cluster them under a new group to make sure that the 'fairness' we aimed to achieve is mantained.

<img width="820" alt="Screen Shot 2022-10-12 at 11 10 56 PM" src="https://user-images.githubusercontent.com/105120795/195497433-112b0754-a9ad-4e77-bd4d-8c08d3cfab3e.png">

> Both Bugatti Veyron's are located in the bottom left corner of the 3D scatter plot!



