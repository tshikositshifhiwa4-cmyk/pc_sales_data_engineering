
--creating dimension tables
--1. dim_customers drop TABLE [pc_staging].[dbo].[dim_customer]

CREATE TABLE [pc_staging].[dbo].[dim_customer]( [customer_id] int identity(1, 1) primary key, [first_name] [nvarchar](50) NOT NULL, [last_name] [nvarchar](50) NOT NULL, [contact_number] [nvarchar](50) NOT NULL, [email_address] [nvarchar](50) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_customer] (first_name, last_name, contact_number, email_address )
SELECT  distinct Customer_Name
       ,Customer_Surname
       ,Customer_Contact_Number
       ,Customer_Email_Address

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_customer]; --checking duplicates

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
--2.dim_employee
 drop TABLE [pc_staging].[dbo].[dim_employee]

CREATE TABLE [pc_staging].[dbo].[dim_employee]( [employee_id] int identity(1, 1) primary key, [employee_name] [nvarchar](50) NOT NULL, [department] [nvarchar](50) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_employee] (employee_name, department)
SELECT  distinct Sales_Person_Name
       ,Sales_Person_Department

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_employee]; --checking duplicates

SELECT  employee_name
       ,department
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_employee]
GROUP BY  employee_name
         ,department
HAVING count (*) > 1;
--3.dim_product
 drop TABLE [pc_staging].[dbo].[dim_product]

CREATE TABLE [pc_staging].[dbo].[dim_product]( [product_id] int identity(1, 1) primary key, [pc_make] [nvarchar](50) NOT NULL, [pc_model] [nvarchar](50) NOT NULL, [storage_type] [nvarchar](50) NOT NULL, [storage_capacity] [nvarchar](50) NOT NULL, [ram] [nvarchar](50) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_product] (pc_make, pc_model, storage_type, storage_capacity, ram)
SELECT  distinct pc_make
       ,pc_model
       ,storage_type
       ,storage_capacity
       ,ram

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_product]; --checking duplicates

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
--4.dim_location
 drop TABLE [pc_staging].[dbo].[dim_location]

CREATE TABLE [pc_staging].[dbo].[dim_location]( [location_id] int identity(1, 1) primary key, [continent] [nvarchar](50) NOT NULL, [country_or_state] [nvarchar](50) NOT NULL, [province_or_city] [nvarchar](100) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_location] (continent, country_or_state, province_or_city)
SELECT  distinct continent
       ,country_or_state
       ,province_or_city

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_location]; --checking duplicates

SELECT  continent
       ,country_or_state
       ,province_or_city
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_location]
GROUP BY  continent
         ,country_or_state
         ,province_or_city
HAVING count (*) > 1;
--5.dim_store
 drop TABLE [pc_staging].[dbo].[dim_store]

CREATE TABLE [pc_staging].[dbo].[dim_store]( [store_id] int identity(1, 1) primary key, [shop_name] [nvarchar](50) NOT NULL, [shop_age] [nvarchar](50) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_store] (shop_name, shop_age)
SELECT  distinct shop_name
       ,shop_age

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_store]; --checking duplicates

SELECT  shop_name
       ,shop_age
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_store]
GROUP BY  shop_name
         ,shop_age
HAVING count (*) > 1;
--6.dim_payment
 drop TABLE [pc_staging].[dbo].[dim_payment]

CREATE TABLE [pc_staging].[dbo].[dim_payment]( [payment_id] int identity(1, 1) primary key, [Payment_Method] [nvarchar](50) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_payment] (payment_method)
SELECT  distinct payment_method

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_payment]; --checking duplicates

SELECT  payment_method
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_payment]
GROUP BY  payment_method
HAVING count (*) > 1;
--7.dim_channel
 drop TABLE [pc_staging].[dbo].[dim_channel]

CREATE TABLE [pc_staging].[dbo].[dim_channel]( [channel_id] int identity(1, 1) primary key, [Channel] [nvarchar](50) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_channel] (channel)
SELECT  distinct channel

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_channel]; --checking duplicates

SELECT  channel
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_channel]
GROUP BY  channel
HAVING count (*) > 1;
--8.dim_priority
 drop TABLE [pc_staging].[dbo].[dim_priority]

CREATE TABLE [pc_staging].[dbo].[dim_priority]( [priority_id] int identity(1, 1) primary key, [Priority] [nvarchar](50) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_priority] (priority)
SELECT  distinct priority

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_priority]; --checking duplicates

SELECT  priority
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_priority]
GROUP BY  priority
HAVING count (*) > 1;
--9.dim_date
 drop TABLE [pc_staging].[dbo].[dim_date]

CREATE TABLE [pc_staging].[dbo].[dim_date]( [date_id] int identity(1, 1) primary key, [purchase_date] [date] NOT NULL, [ship_date] [date] NULL, [year] int NOT NULL, [month] int NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[dim_date] (purchase_date, ship_date, year, month)
SELECT  distinct purchase_date
       ,coalesce(try_cast(ship_date AS date),'9999-12-31')
       ,year(purchase_date)
       ,month(purchase_date)

FROM [pc_staging].[dbo].[pc_data]; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[dim_date]; --checking duplicates

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
--creating the fact table
 drop TABLE [pc_staging].[dbo].[pc_sales_fact]

CREATE TABLE [pc_staging].[dbo].[pc_sales_fact]( [sales_id] int identity(1, 1) primary key, [customer_id] int NOT NULL, [employee_id] int NOT NULL, [product_id] int NOT NULL, [location_id] int NOT NULL, [store_id] int NOT NULL, [payment_id] int NOT NULL, [channel_id] int NOT NULL , [priority_id] int NOT NULL , [date_id] int NOT NULL, [Cost_Price] decimal(10, 2) NOT NULL, [Sale_Price] decimal(10, 2) NOT NULL, [Discount_Amount] decimal(10, 2) NOT NULL, [Finance_Amount] decimal(10, 2) NOT NULL, [Cost_of_Repairs] decimal(10, 2) NOT NULL, [Total_Sales_per_Employee] decimal(10, 2) NOT NULL, [PC_Market_Price] decimal(10, 2) NOT NULL, [Credit_Score] decimal(10, 2) NOT NULL, [load_date] datetime default getdate() )
INSERT INTO [pc_staging].[dbo].[pc_sales_fact] (customer_id, employee_id, product_id, location_id, store_id, payment_id, channel_id, priority_id, date_id, sale_price, cost_price, discount_amount, finance_amount, cost_of_repairs, total_sales_per_employee, pc_market_price, credit_score)
SELECT  c.customer_id
       ,e.employee_id
       ,p.product_id
       ,l.location_id
       ,s.store_id
       ,pm.payment_id
       ,ch.channel_id
       ,pr.priority_id
       ,d.date_id
       ,cast(st.sale_price               AS decimal(10,2))
       ,cast(st.cost_price               AS decimal(10,2))
       ,cast(st.discount_amount          AS decimal(10,2))
       ,cast(st.finance_amount           AS decimal(10,2))
       ,cast(st.cost_of_repairs          AS decimal(10,2))
       ,cast(st.total_sales_per_employee AS decimal(10,2))
       ,cast(st.pc_market_price          AS decimal(10,2))
       ,st.credit_score
FROM [pc_staging].[dbo].[pc_data] AS st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo]. [dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram
INNER JOIN [pc_staging].[dbo].[dim_location] l
ON st.Continent = l.continent AND st.province_or_city = l.province_or_city AND st.Country_or_State = l.country_or_state
INNER JOIN [pc_staging].[dbo].[dim_store] s
ON st.shop_name = s.shop_name AND st.Shop_Age = s.shop_age
INNER JOIN [pc_staging].[dbo].[dim_payment] pm
ON st.payment_method = pm.payment_method
INNER JOIN [pc_staging].[dbo].[dim_channel] ch
ON st.channel = ch.channel
INNER JOIN [pc_staging].[dbo].[dim_priority] pr
ON st.priority = pr.priority
INNER JOIN [pc_staging].[dbo].[dim_date] d

ON st.purchase_date = d.purchase_date AND coalesce(try_cast(st.ship_date AS date), '9999-12-31') = d.ship_date; --validating the insert

SELECT  *
FROM [pc_staging].[dbo].[pc_sales_fact] --checking duplicates
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
--------------------------------------------------------------------------------------------------------------
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
HAVING COUNT(*) > 1; --dim_employee

SELECT  employee_name
       ,department
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_employee]
GROUP BY  employee_name
         ,department
HAVING count (*) > 1; --dim_product

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
HAVING count (*) > 1; --dim_location

SELECT  continent
       ,country_or_state
       ,province_or_city
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_location]
GROUP BY  continent
         ,country_or_state
         ,province_or_city
HAVING count (*) > 1; --dim_store

SELECT  shop_name
       ,shop_age
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_store]
GROUP BY  shop_name
         ,shop_age
HAVING count (*) > 1; --dim_payment

SELECT  payment_method
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_payment]
GROUP BY  payment_method
HAVING count (*) > 1; --dim_channel

SELECT  channel
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_channel]
GROUP BY  channel
HAVING count (*) > 1; --dim_priority

SELECT  priority
       ,count (*) AS duplicates
FROM [pc_staging].[dbo].[dim_priority]
GROUP BY  priority
HAVING count (*) > 1; --dim_date

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
HAVING count (*) > 1; --pc_sales_fact

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
--------------------------------------------------------------------------------------------------------------
--validating JOIN explosion
 --checking tables that duplicate/drop the rows
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data]; -- + dim_customer

SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address -- + dim_employee
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo]. [dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department -- + dim_product
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department
INNER JOIN [pc_staging].[dbo].[dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram -- + dim_location
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department
INNER JOIN [pc_staging].[dbo].[dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram
INNER JOIN [pc_staging].[dbo].[dim_location] l
ON st.Continent = l.continent AND st.province_or_city = l.province_or_city AND st.Country_or_State = l.country_or_state -- + dim_store
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department
INNER JOIN [pc_staging].[dbo].[dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram
INNER JOIN [pc_staging].[dbo].[dim_location] l
ON st.Continent = l.continent AND st.province_or_city = l.province_or_city AND st.Country_or_State = l.country_or_state
INNER JOIN [pc_staging].[dbo].[dim_store] s
ON st.shop_name = s.shop_name AND st.Shop_Age = s.shop_age -- + dim_payment
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department
INNER JOIN [pc_staging].[dbo].[dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram
INNER JOIN [pc_staging].[dbo].[dim_location] l
ON st.Continent = l.continent AND st.province_or_city = l.province_or_city AND st.Country_or_State = l.country_or_state
INNER JOIN [pc_staging].[dbo].[dim_store] s
ON st.shop_name = s.shop_name AND st.Shop_Age = s.shop_age
INNER JOIN [pc_staging].[dbo].[dim_payment] pm
ON st.payment_method = pm.payment_method -- + dim_channel
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department
INNER JOIN [pc_staging].[dbo].[dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram
INNER JOIN [pc_staging].[dbo].[dim_location] l
ON st.Continent = l.continent AND st.province_or_city = l.province_or_city AND st.Country_or_State = l.country_or_state
INNER JOIN [pc_staging].[dbo].[dim_store] s
ON st.shop_name = s.shop_name AND st.Shop_Age = s.shop_age
INNER JOIN [pc_staging].[dbo].[dim_payment] pm
ON st.payment_method = pm.payment_method
INNER JOIN [pc_staging].[dbo].[dim_channel] ch
ON st.channel = ch.channel -- + dim_priority
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department
INNER JOIN [pc_staging].[dbo].[dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram
INNER JOIN [pc_staging].[dbo].[dim_location] l
ON st.Continent = l.continent AND st.province_or_city = l.province_or_city AND st.Country_or_State = l.country_or_state
INNER JOIN [pc_staging].[dbo].[dim_store] s
ON st.shop_name = s.shop_name AND st.Shop_Age = s.shop_age
INNER JOIN [pc_staging].[dbo].[dim_payment] pm
ON st.payment_method = pm.payment_method
INNER JOIN [pc_staging].[dbo].[dim_channel] ch
ON st.channel = ch.channel
INNER JOIN [pc_staging].[dbo].[dim_priority] pr
ON st.priority = pr.priority -- + dim_date
SELECT  count (*) AS row_numbers
FROM [pc_staging].[dbo].[pc_data] st
INNER JOIN [pc_staging].[dbo].[dim_customer] c
ON st.customer_name = c.first_name AND st.Customer_Surname = c.last_name AND st.Customer_Contact_Number = c.contact_number AND st.Customer_Email_Address = c.email_address
INNER JOIN [pc_staging].[dbo].[dim_employee] e
ON st.sales_person_name = e.employee_name AND st.Sales_Person_Department = e.department
INNER JOIN [pc_staging].[dbo].[dim_product] p
ON st.pc_model = p.pc_model AND st.pc_make = p.pc_make AND st.Storage_Capacity = p.storage_capacity AND st.Storage_Type = p.storage_type AND st.ram = p.ram
INNER JOIN [pc_staging].[dbo].[dim_location] l
ON st.Continent = l.continent AND st.province_or_city = l.province_or_city AND st.Country_or_State = l.country_or_state
INNER JOIN [pc_staging].[dbo].[dim_store] s
ON st.shop_name = s.shop_name AND st.Shop_Age = s.shop_age
INNER JOIN [pc_staging].[dbo].[dim_payment] pm
ON st.payment_method = pm.payment_method
INNER JOIN [pc_staging].[dbo].[dim_channel] ch
ON st.channel = ch.channel
INNER JOIN [pc_staging].[dbo].[dim_priority] pr
ON st.priority = pr.priority
INNER JOIN [pc_staging].[dbo].[dim_date] d
ON st.purchase_date = d.purchase_date AND coalesce(try_cast(st.ship_date AS date), '9999-12-31') = d.ship_date;