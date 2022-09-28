# Fuel System Predictions (FINAL PROJECT)

## Overview

### Purpose

The purpose of this project is to predict the best fuel system for a car based on different design parameters. This model will be used to assist engineering design teams in determing the most ideal fuel system to use when designing a new car.

### Source of Data

[Link](https://www.kaggle.com/code/goyalshalini93/car-price-prediction-linear-regression-rfe/notebook)

The data we used for this project was retreived from Kaggle, in the above link. The data is stored in a csv. The data contains 24 distinct columns with information pertaining to car specs from 22 different automakers. Questions we hope to answer from the data, is to determine what factors assist in predicting the fuel system for a car.  

### Communication Protocol

Our team will communicate with each other using our group channel in Slack and Teams. We will meet during regular classtime as a group to discuss the status of the project and what needs to be handled individually going forward. Any group meetings outside of regular class hours are open, depending on each individuals availability. Anything discussed in a group session when all members are not present will be summarized and noted in the group channel on Slack.

### Tools Used

- Python/Jupyter Notebook will be used to clean the data and run the code the for the Machine Learning Algorithim

- PostgreSQL will be used to store our database 

- AWS will be used to allow others access to out database

### Data Exploration
We considered different topics of interests within the group including predicting favorite ice cream flavors in a specific area of Houston, finance and best time to book a hotel. We eventually decided to create a model to predict the best fuel system for a car based on different car specs, using a dataset that includes different variables such as brand, location of engine and wheel base among others.

### Analysis
We started our analysis by opening the .csv file in Excel to get a general feel for the information provided and making sure we understood what each spec meant and what value it could have for our analysis. After this we created a dataframe and looked at each datatype to decide if there was any column that should be converted.<br>
We also created a heatmap to get a better understanding of how the different variables correlated to each other:<br>

![correlation_heatmap](https://user-images.githubusercontent.com/105120795/192700447-8c6a98ce-460a-43d6-9277-d9ebd1f03a74.png)

## Results

### Summary
