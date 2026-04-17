--checking dimension tables duplicates
--dim_customer
SELECT  first_name
       ,last_name
       ,contact_number
       ,email_address
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_customer]
GROUP BY  first_name
         ,last_name
         ,contact_number
         ,email_address
HAVING COUNT(*) > 1;
--dim_employee

SELECT  employee_name
       ,department
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_employee]
GROUP BY  employee_name
         ,department
HAVING count (*) > 1; 
--dim_product

SELECT  pc_make
       ,pc_model
       ,storage_type
       ,storage_capacity
       ,ram
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_product]
GROUP BY  pc_make
         ,pc_model
         ,storage_type
         ,storage_capacity
         ,ram
HAVING count (*) > 1;
--dim_location

SELECT  continent
       ,country_or_state
       ,province_or_city
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_location]
GROUP BY  continent
         ,country_or_state
         ,province_or_city
HAVING count (*) > 1; 
--dim_store

SELECT  shop_name
       ,shop_age
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_store]
GROUP BY  shop_name
         ,shop_age
HAVING count (*) > 1; 
--dim_payment

SELECT  payment_method
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_payment]
GROUP BY  payment_method
HAVING count (*) > 1; 
--dim_channel

SELECT  channel
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_channel]
GROUP BY  channel
HAVING count (*) > 1; 
--dim_priority

SELECT  priority
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_priority]
GROUP BY  priority
HAVING count (*) > 1; 
--dim_date

SELECT  purchase_date
       ,ship_date
       ,year
       ,month
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_date]
GROUP BY  purchase_date
         ,ship_date
         ,year
         ,month
HAVING count (*) > 1; 
--pc_sales_fact

SELECT  sale_price
       ,cost_price
       ,discount_amount
       ,finance_amount
       ,cost_of_repairs
       ,total_sales_per_employee
       ,pc_market_price
       ,credit_score
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[pc_sales_fact]
GROUP BY  sale_price
         ,cost_price
         ,discount_amount
         ,finance_amount
         ,cost_of_repairs
         ,total_sales_per_employee
         ,pc_market_price
         ,credit_score
HAVING count (*) > 1;