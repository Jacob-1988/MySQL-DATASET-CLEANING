-- DATA CLEANING
-- IDENTIFYING DATA INCONSISTENCIES IN EACH COLUMN OF THE USED TABLE (ebay_women_perfume table) 
select *
from ebay_women_perfume;
-- We've been able to see blanks , ~ CREPE ERASE ~

-- to check the values in each column 
select distinct brand 
from ebay_women_perfume;

select distinct title -- Hot Couture by Givenchy for Women EDP 3.3 oz - 100 ml *NEW IN SEALED BOX* (irregular entries)
from ebay_women_perfume;

select distinct type -- ~ BODY FIRM ADVANCED BODY REPAIR TREATMENT ~, / , 1, blank ( Irregular entries to be cleaned here)
from ebay_women_perfume;

select  distinct price 
from ebay_women_perfume;

select  distinct priceWithCurrency -- reamove /ea (Irregular entries to be cleaned in this column)
from ebay_women_perfume;

select distinct available -- replace blanks, now null (Irregular entries to be cleaned in this column)
from ebay_women_perfume;

select  distinct availableText --  replace blanks, now null
from ebay_women_perfume;

select  distinct sold --  replace blanks now null (Irregular entries to be cleaned in this column)
from ebay_women_perfume;

select  distinct lastUpdated -- blanks, change datatype to datetime (Irregular entries to be cleaned in this column)
from ebay_women_perfume;

select  distinct itemLocation -- change USA  TO United States (Irregular entries to be cleaned in this column)
from ebay_women_perfume;

-- SOLUTION TO EACH COLUMN'S DATA WRONGLY ENTERED
-- checking for nulls, blanks
select brand 
from ebay_women_perfume
where brand is null or brand= "null" or brand = "";

select type 
from ebay_women_perfume
where type is null or type= "null" or type = "";

select available  -- null 
from ebay_women_perfume
where available is null or available= "null" or available = "";

-- CHANGING YOUR BLANKS TO NULL (here we use the update statement)
set SQL_SAFE_UPDATES = 0; -- This helps in putting off the safe update mode, so as to enable the update statement run
update ebay_women_perfume
set brand = null
where brand ="";

update ebay_women_perfume
set type = null
where type ="";

select *
from ebay_women_perfume
where type is null ;

update ebay_women_perfume
set available  = null
where available  ="";

update ebay_women_perfume
set availabletext  = null
where availabletext  ="";

update ebay_women_perfume
set sold  = null
where sold  ="";

update ebay_women_perfume
set lastupdated  = null
where lastupdated  ="";

-- replacing the null with versace 
select *, ifnull(brand,"Versace") as brand_
from ebay_women_perfume
where brand is null ;

update ebay_women_perfume
set brand = ifnull(brand,"Versace");

select *
from ebay_women_perfume
where brand = "Versace";

-- replace  ~ CREPE ERASE ~ with nothing 
select brand, trim(replace(brand, "~", "")) as brand_
from ebay_women_perfume
 where brand = "CREPE ERASE";
 
 update ebay_women_perfume
 set brand = trim(replace(brand, "~", ""));
 
 update ebay_women_perfume
 set brand = trim(brand);
 
 -- 
 select lastupdated
 from ebay_women_perfume;
 
 -- HANDLING ALL IRREGULARITIES EARLIER SPOTTED IN THE DATASET
 -- Change USA to United state of America
 SELECT  itemlocation, replace (ITEMLOCATION, "USA", "United State") as location
 from ebay_women_perfume;
 
 update ebay_women_perfume
 set itemlocation = replace (ITEMLOCATION, "USA", "United State");
 
 -- To remove /ea from pricewithcurrency column
select priceWithCurrency, replace (pricewithcurrency, "/ea", "") as price
from ebay_women_perfume; 

update ebay_women_perfume
set pricewithcurrency =  replace (pricewithcurrency, "/ea", "");

-- To remove Hot Couture by Givenchy for Women EDP 3.3 oz - 100 ml *NEW IN SEALED BOX*in the title column
select title, replace (title, "*", "") as title_
from ebay_women_perfume;

update ebay_women_perfume
set title = replace (title, "*", "");

-- CHanging datatype from text to datetime in lastupdated column
select lastupdated, left(lastupdated, 22) as date_
from ebay_women_perfume;

update ebay_women_perfume
set lastupdated = left(lastupdated, 22);

-- Case
select lastupdated,
case
when lastupdated like "%23 may 2024 02:42:14%" 
then str_to_date (left(lastupdated, 20), "%d %M %Y %H:%i:%s")
else str_to_date (left(lastupdated, 22), "%M %d %Y %H:%i:%s")
end as date_  
from ebay_women_perfume;

