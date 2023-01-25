# Crowdfunding_ETL
Project 2

-------------

This repository includes:

    (1) ETL_Mini_project_JShulyak.ipynb <br />
    (2) crowdfunding_db_schema.sql <br />
    (3) Resources folder <br />
        a. campaign.csv 
        b. category.csv 
        c. contacts.csv 
        *d.* contacts.xlsx 
        *e.* crowdfunding.xlsx 
        *f.* subcategory.csv 
    (4) Images folder 
        * crowdfunding_db_ERD.png
        * postgres_tables_select_statements.png 

-------------

# ETL_Mini_project_JShulyak.ipynb
* This jupyter notebook uses python to:

    (1) import data from the xlsx files

    (2) transform the data into four dataframes

        a. category: 
            1. category_id (string)
            2. category (string)

        b. subcategory
            1. subcategory_id (string)
            2. subcategory  (string)

        c. campagin
            1. cf_id (integer)
            2. contact_id (integer)
            3. company_name (string)
            4. description (string)
            5. goal (float)
            6. pledged (float)
            7. backers_count (integer)
            8. country (string)
            9. currency (string)
            10. launch_date (date)
            11. end_date (date)
            12. category_id (string)
            13. subcategory_id (string)

        d. contact
            1. contact_id (integer)
            2. first_name (string)
            3. last_name (string)
            4. email (string)

    (3) export the dataframes as csv files

    -------------

# crowdfunding_db_schema.sql
* This sql files builds the tables necessary for the databse. The schema matches the entitity relational diagram located in the images folder. 
* Select statements were used to verify that the tables were created and the data imported into them properly. 
* The csv files should be imported into the tables in the following order:
    1. contacts
    2. category
    3. subcategory
    4. campaign
    * As long as the campaign table is last, the schema will work properly. 
