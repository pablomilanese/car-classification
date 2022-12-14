-- mockup schema for sql database
-- actual database can be found on CarStat_Prediction.ipynb

CREATE TABLE "fuelsystemdb" (
'car_ID' INT NOT NULL,
'symboling' INT NOT NULL,
'CarName' VARCHAR NOT NULL,
'fueltype' VARCHAR NOT NULL,
'aspiration' VARCHAR NOT NULL,
'doornumber' INT NOT NULL,
'carbody' VARCHAR NOT NULL,
'drivewheel' VARCHAR NOT NULL,
'enginelocation' VARCHAR NOT NULL,
'wheelbase' FLOAT NOT NULL,
'carlength' FLOAT NOT NULL,
'carwidth' FLOAT NOT NULL,
'carheight' FLOAT NOT NULL,
'curbweight' INT NOT NULL,
'enginetype' VARCHAR NOT NULL,
'cylindernumber' INT NOT NULL,
'enginesize' INT NOT NULL,
'fuelsystem' VARCHAR NOT NULL,
'boreratio' FLOAT NOT NULL,
'stroke' FLOAT NOT NULL,
'compressionratio' INT NOT NULL,
'horsepower' INT NOT NULL,
'peakrpm' INT NOT NULL,
'citympg' INT NOT NULL,
'highwaympg' INT NOT NULL,
'price' INT NOT NULL,
PRIMARY KEY ("fuelsystem")
);
