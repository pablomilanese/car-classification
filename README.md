# END GAME RACE HEAT CLASSIFICATION

## Overview
The purpose of this project is to group cars by multiple variables that would pair them fairly to race together. Although it may seem obvious that a Bugatti and a Honda Civic cannot reasonably compete, the line gets blurred when we start to consider cars that have similar specs but differ in others. We chose this topic because 

The presentation can be found [here]() and the dashboard can be found [here](https://public.tableau.com/app/profile/miranda.jimenez/viz/RoughDraft_16650241899510/Story1?publish=yes).

## Source of Data
After considering different datasets on Kaggle we decided to use [this one]() because it included a 11,914 unique cars with multiple variables. These variables include engine fuel type, engine horsepower, cylinders, transmission, driven wheels, number of doors, market category, wehicle size, highway MPG, city MPG, popurality and MSRP. It was crucial for this project that we worked with a large dataset to display how our classification model groups cars when multiple variables are considered. Our dataset was initially split 

## Technology & Tools
To code our classification model and process our data we used python's `pandas`, `Scikit-learn`, `plotly` and `matplotlib` libraries on jupyter notebook.<br>
To import our initial database into the model and store our results we used `AWS`'s cloud storage as well as python's `psycopg2` driver and `sqlalchemy` library to connect our code to `postgres`. Our ERD can be found [here]().<br>
To present our project we used `google slides` for our presentation and `tableau` for our dashboard.

## Analysis phase of the project

#### DATA EXPLORATION
Our first step was to identify how many null values and what object types we were working with. We found the following:

|	#	|	Column	|	Non-Null Count	|	Dtype	|
|	-------------	|	-------------	|	-------------	|	-------------	|
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
|	-------------	|	-------------	|	-------------	|	-------------	|
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
Clustering is an unsupervised method that helps by creating groups or clusters of data that is not labeled. This helps us find patterns in the data, which in return allows us to draw conclusions.<br>
review with team, maybe expand on this point<br>

##### BENEFITS<br>
The main benefits that attracted us to K-means is that it scales to large data sets and helps create convergence. Because our goal was to classify cars with different variables into four groups, we found the K-means models to be the best suited option for this task.

##### LIMITATIONS<br>
The biggest limitations of clustering models occurs when the data is of varying size and density. Specifically, outliers may drag information from the center, making the model less accurate. In our case we had two outliers that did not skew our data. Although another limitation is that when we scale with number of dimensions there can be an increase in distance, we can correct this by using PCA (principal component analysis) to modify the clustering algorithm. <br>


#### CHANGES IN MODEL CHOICE<br>
review with team<br>

#### MODEL TRAINING<br>
review with team<br>

#### ACCURACY SCORE<br>
review with team<br>

## Overview
