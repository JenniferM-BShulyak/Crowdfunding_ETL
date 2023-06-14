# Crowdfunding_ETL

## Purpose:

The purpose of this project is to find trends in crowdfunding campaigns. Some questions to be investigated include: 


## Methodology: 

### Repository: 
    * ETL_Mini_project_JShulyak.ipynb
    * crowdfunding_db_schema.sql
    * Resources
        * campaign.csv 
        * category.csv 
        * contacts.csv 
        * contacts.xlsx 
        * crowdfunding.xlsx 
        * subcategory.csv
    * Images
        * crowdfunding_db_ERD.png
        * postgres_tables_select_statements.png 

### ETL in Python:

The crowdfunding.xlsx and contacts.xlsx files were loaded into Pandas Dataframes. The dataframes were cleaned and transformed into four organize dataframes. The transformations that occurred included breaking apart columns, converting the date data to datetime format, dropping unwanted fields, and creating primary keys. The transformed dataframes: 
    (1) category: 
        * category_id (string)
        * category (string)
    (2) subcategory: 
        * subcategory_id (string)
        * subcategory (string)
    (3) campaign:
        * cf_id (integer)
        * contact_id (integer)
        * company_name (string)
        * description (string)
        * goal (float)
        * pledged (float)
        * backers_count (integer)
        * country (string)
        * currency (string)
        * launch_date (date)
        * end_date (date)
        * category_id (string)
        * subcategory_id (string)
     (4) contact
        * contact_id (integer)
        * first_name (string)
        * last_name (string)
        * email (string)
       

The four transformed dataframes were written as csv files to load into a PostgreSQL database. 

### Entity Relationship Diagram:



### Data Exploration in PostgreSQL:

Schema written in PostgreSQL to build and populate tables (one for each transformed csv).

Schema written to answer questions and explore data.
