
# Using Data Science to determine whta kind of app to develop for the Google App Store
John Michitsch

## Abstract
This project is to perform preliminary EDA on a dataset and develop a proposal for a data science project. 

## Design
Experienced software developer and / or small independent firm want to develop an app for Android.  
What does the public want?  (Using Google Play Store data can we determine which apps are most installed.)

## Data
### Data Source
Data was found on Kaggle
https://www.kaggle.com/gauthamp10/google-playstore-apps

CSV file of ~1.1 million apps (20+ features) scraped from the Google App Store with release dates from 2010 - 2020. 

## Algorithms
CSV file was loaded into SQLite. Some data cleaning was performed and a summary dataset of 50K rows created. 
Summary dataset loaded to Google Sheets. Further cleaning and EDA performed. 
Data loaded to Tableau for visualizations.

## Tools
SQLite3 used to house the raw data and export a summary
Google sheets used to further clean and organize the data and for EDA
Tableau Public used for visualizations

## Communication
Findings are consolidated in a Keynote presentation and the supporting Google Sheets and Tableau workbook can also be found here.
