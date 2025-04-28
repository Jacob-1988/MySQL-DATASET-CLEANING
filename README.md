# MySQL-DATASET-CLEANING:
## eBay_Women's_Perfume Data Cleaning Project

## Statement of Problem
The above mentioned name is an online store specifically related to women perfume.
The original dataset contained inconsistencies such as blank fields, null values, incorrect date format, wrong data type, which could affect the accuracy of analysis and decision making. 
Data cleaning was therefore necessary to remove errors, standardize entries and ensure the dataset accurately represents women's perfume  product sold on eBay. The cleaned dataset now provides a reliable foundation for further analysis, trend identification, and business informed insights.


## Steps Followed:
Step 1: Converting the dataset from Excel format to CSV format. 
- I  located where the dataset is saved in my system
- Now saved it as CSV and no longer Excel file extension name.
step 2: Data importation.
- Open MySQL workbench
- Under a particular database of which I intend adding this table to, I right clicked on " table data import wizard', to import the data 
Step 3: Data  review to identify issues like:
- Blank fields
- Null values
- Incorrect date format
- Incorrect data types (e.g., datetime for text)
Step 4: Data Cleaning and Transformation
- I replaced blank fields with null where necessary.
- The null values were afterwards replaced with appropriate brand names.
Step 5: Date Format Adjustments
- I formatted dates to match the DATETIME format in MySQL.

Step 6: 	Removing Backticks and Extra Characters.

Step7: Some SQL Queries Used:

- select available  -- null 

from ebay_women_perfume
where available is null or available= "null" or available = "";


-	select lastupdated,
case

when lastupdated like "%23 may 2024 02:42:14%" 
then str_to_date (left(lastupdated, 20), "%d %M %Y %H:%i:%s")
else str_to_date (lastupdated, "%M %d, %Y %H:%i:%s")

end as date_  
from ebay_women_perfume;

- change datatype
alter table ebay_women_perfume

modify lastUpdated datetime;

Step 8: Dataset in its Excel format before being imported and cleaned:

[ebay_womens_perfume(1).csv](https://github.com/user-attachments/files/19932822/ebay_womens_perfume.1.csv)





