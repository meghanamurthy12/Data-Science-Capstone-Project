# Data-Science-Capstone-Project : 


The analysis and code for this project may be broken up into three distinct part:
<br/>
1 - Data preparation
	- UR data preparation
	- Weather data analysis
	- Solar declination angle
	- Daily aggregation
	- Hourly aggregation
<br/>
2 - Predictive Modeling
	- Exploration
	- Baseline Models
	- Gaussian Processes
<br/>
3 - Further Feature Exploration
	- XGBoost Model
	- LightGB model
############################################
<br/>
Part 1 - Data Preparation
The steps to re-run the data preparation and data creation are detailed below

- DATA FOR PREDICTIVE MODELING
1) Open an run the file labeled 2.1-Daily_Data.ipynb
2) This file requires a raw weather data download from NOAA (formatting will be completed by the script) and a formated GAC solar panel file with on column for date and another for KW energies 
3) A data file comprised of the daily aggregates will be created in the current folder

- DATA FOR FURTHER FEATURE EXPLORATION
1) Open the 1.1-Data Preparation.ipynb file
2) This file is broken up into five parts: UR data preparation, Weather data analysis, Solar declination angle. Daily aggregation, Hourly agregation
3) UR data preparation part: in this part we process the UR solar panel data, cleaning the data and replacing missing values
4) Weather data analysis: In this part we explore Rochester weather dataset from NOAA, splitting it into 3 part: minutely, hourly, and daily observations 
5) Solar declination angle: In this part we calculate the solar declination angle, and duration of sun exposure 
6) Daily aggregation: In this part, we calculate daily weather aggregations (maximum, minimum, mean, standard deviation) for all numerical variables, for example, the maximum temptation during the day etc. Afterward, we merge the weather aggregations, and solar declination angle with the solar panel data
7) Hourly aggregation: In this part, we calculate hourly weather aggregations (maximum, minimum, mean, standard deviation) for all numerical variables, for example, the maximum temptation during the hour etc. Afterward, we merge the weather aggregations and solar declination angle with the solar panel data
8) After re-run all these sections, we create two datasets (with hourly and daily aggregations) that we will use for modeling
############################################
Part 2 - Predictive Modeling
The steps to re-run the predictive modeling analysis are detailed below

1) Open and run 2.2-Exploration_graphs.ipynb, this files contains all the code needed to create the exploration graphs seen in the report
2) Open and run 2.3-Baseline_models.R to obtain 5-fold RMSE values for the MLR linear model, as well as the coefficient estimates with their respective confidence intervals
3) Open and run 2.4-Gaussian_Process_Models.ipynb to obtain the final model. This final requires GPFlow to run, a Python library that might be hard to download, but the instructions on the documentation are great.
############################################
Part 3 - Further Feature Exploration
The steps to re-run the further feature exploration analysis are detailed below

1) Open the 1.2-Data Modeling(GradientBoosting).ipynb file
2) This file is broken up into two parts: XGBoost and LightGBM models
3) Each part consists of parameter tuning, cross-validation, model training, performance evaluation, feature importance parts
4) For performance evaluation we use R^2 and and root mean square error (that you can notice during the model training)

############################################
