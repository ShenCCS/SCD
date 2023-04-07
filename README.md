# SCD (Subjective-Cognitive-Decline-Brain)
## Enviroment

Ubuntu 18.04  

python 3.7.13  

conda env : SCD

## Feature selection
Select importance features (AD8 and MOCA)
data : mean + var + cv (AD8 and MOCA split)
> * Program `R_boruta_Ad8Moca.R`

## Gridsearch + cv
Choose the best model (XGBoost、LightGBM、CatBoost、MLPRegressor)
> * Regression_Feature_Selection(Final).ipynb`

## Model Training
Training
shap values
shap pictures
> * Model_shap_summary(Final).ipynb`
> 
## Cluster
