# Race Heat Grouping (FINAL PROJECT)

## Overview

### Purpose

The purpose of this project is to assist event coordinators in classifying cars to determine which cars will race in each heat.
The use case for such a tool is due to the large amount of cartypes with unique car specs that would be too difficult for a human to categorize efficiently. On top of that, we don't even know what the categoriea are, so this clustering tool will help us get started, in which the next step will involve using Subject Matter Experts to further classify the much more organized data, (Which could also potentially be a supervised learning model).

### Source of Data

[Car Dataset](https://www.kaggle.com/datasets/ander289386/cars-germany?resource=download)

The data we used for this project was retreived from Kaggle, in the above link. The data was scrapped from AutoScout24, one of Europes largest car market places. The information was scrapped from data between 2011 and 2021. Questions we hope to answer from the data, is to determine if there is a correlation betwen the transmission and the number of engine cylinders, and can the number of cyclinders be used to predict what type of transmission needs to be used.  

### Communication Protocol

Our team will communicate with each other using our group channel in Slack and Teams. We will meet during regular classtime as a group to discuss the status of the project and what needs to be handled individually going forward. Any group meetings outside of regular class hours are open, depending on each individuals availability. Anything discussed in a group session when all members are not present will be summarized and noted in the group channel on Slack.

### Tools Used

- Python/Jupyter Notebook will be used to clean the data and run the code the for the Machine Learning Algorithim

- PostgreSQL will be used to store our database 

- AWS will be used to allow others access to out database

-SQLAlchemy is used to store our data into a database

### Data Exploration
We first determined if there were any columns that could be removed.
Make and model will be used later in the labelling process for when we group the cars.
Year is a wildcard. This does indirectly play a bit into the car performance due to design specs may differ between models from the same maker but manufactured in a different year.
Fuel Type is not as prevelant, but is still useful depending on the type of specs the drivers would like to race on.
Horsepower holds the most weight as that is typically the standard for creating matchups.
Cylinder count has correlation to horsepower, so this column can be used to assist for later classification.
Transmission type would hold second largest weight when mathcing cars, as that is a controversial topic in the race world.
Driven wheels holds some weight depending 

Number of doors not even questionable
Market Category not pertinant at all to performance

Vehicle size is the closes we have to a volume and weight which is relevent to top speed
Vehicle style is the closest category to the shape and also plays a role in top speed
Highway MPG is questionably relevant, but could potentially play a role in speed performance

city MPG is not relevant here as there will be no constant stops in this race

Popularity - who cares?
MSRP - Not relevant to speed at all

Then we used clustering to confirm if there are any relations between the transmission and the other categories

![correlation_heatmap](https://user-images.githubusercontent.com/105120795/192700447-8c6a98ce-460a-43d6-9277-d9ebd1f03a74.png)

### Analysis
We started our analysis by opening the .csv file in Excel to get a general feel for the information provided and making sure we understood what each spec meant and what value it could have for our analysis. After this we created a dataframe and looked at each datatype to decide if there was any column that should be converted.
Looking at the heatmap there was a substantial positive correlation between the transmission and the number of cylinders



## Results

### Summary
