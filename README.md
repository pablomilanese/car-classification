https://docs.google.com/presentation/d/1B7tiqK9pZ7de9wioay8c8njbmgje4rB_3YPLMKv_FNg/edit?usp=sharing

# Fuel System Predictions (FINAL PROJECT)

## Overview

### Purpose

The purpose of this project is to predict the best fuel system for a car based on different design parameters. This model will be used to assist engineering design teams in determing the most ideal fuel system to use when designing a new car.

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
Then we created an additional column to convert the transmission types into a integer categorical value to assist in creating a heat map.
We decided to use Seaborn to create a heatmap to show if there were any correlations between the transmission and other categories in the dataset.
Then we used clustering to confirm if there are any relations between the transmission and the other categories

![correlation_heatmap](https://user-images.githubusercontent.com/105120795/192700447-8c6a98ce-460a-43d6-9277-d9ebd1f03a74.png)

### Analysis
We started our analysis by opening the .csv file in Excel to get a general feel for the information provided and making sure we understood what each spec meant and what value it could have for our analysis. After this we created a dataframe and looked at each datatype to decide if there was any column that should be converted.
Looking at the heatmap there was a substantial positive correlation between the transmission and the number of cylinders



## Results

### Summary

### Dashboard
https://public.tableau.com/app/profile/miranda.jimenez/viz/DashboardDataDisplay/DataDisplay?publish=yes
