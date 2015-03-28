# datasimr

###Simulate  random data using a data.frame as in put with R.

A package to take a data.frame and generate simulated data. The end goal is to have a "test" data set that cannot be used to identify an individual in sensitive data, but can be used for developing / debugging software. 

**I make no claim that the output of  this code will comply with any privacy regulations of any sort**

Right now the code will generate a new data frame from a provided data frame. THE USER IS REQUIRED TO REMOVE SENSITIVE COLUMNS LIKE ADDRESS OR ID.

For variables with less than 100 unique values (adjustable) or are factors, the code will draw from the draw from the observed discrete distribution. 
For variables with more than 100 values it will assume normality with mean and sd from the data. If the values are integers in the data, it will make them integers in the simulation.

Features not yet implemented:
* the option to include missingness
* the option to specify which columns of the input data.frame to exclude
* additional features for panel data
