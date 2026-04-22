

-- 1. dim_customer 
CREATE OR ALTER PROCEDURE sp_load_dim_customer
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_customer]
    (first_name, last_name, contact_number, email_address)
    SELECT DISTINCT
        Customer_Name,
        Customer_Surname,
        Customer_Contact_Number,
        Customer_Email_Address
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--2. dim_employee
CREATE OR ALTER PROCEDURE sp_load_dim_employee
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_employee]
    (employee_name, department)
    SELECT DISTINCT
        Sales_Person_Name,
        Sales_Person_Department
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

-- 3. dim_product
CREATE OR ALTER PROCEDURE sp_load_dim_product
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_product]
    (pc_make, pc_model, storage_type, storage_capacity, ram)
    SELECT DISTINCT
        pc_make,
        pc_model,
        storage_type,
        storage_capacity,
        ram
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--4. dim_location
CREATE OR ALTER PROCEDURE sp_load_dim_location
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_location]
    (continent, country_or_state, province_or_city)
    SELECT DISTINCT
        continent,
        country_or_state,
        province_or_city
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--5. dim_store 
CREATE OR ALTER PROCEDURE sp_load_dim_store
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_store]
    (shop_name, shop_age)
    SELECT DISTINCT
        shop_name,
        shop_age
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--6. dim_payment
CREATE OR ALTER PROCEDURE sp_load_dim_payment
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_payment]
    (payment_method)
    SELECT DISTINCT
        payment_method
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--7. dim_channel
CREATE OR ALTER PROCEDURE sp_load_dim_channel
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_channel]
    (channel)
    SELECT DISTINCT
        channel
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--8. dim_priority 
CREATE OR ALTER PROCEDURE sp_load_dim_priority
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_priority]
    (priority)
    SELECT DISTINCT
        priority
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--9. dim_date 
CREATE OR ALTER PROCEDURE sp_load_dim_date
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[dim_date]
    (purchase_date, ship_date, year, month)
    SELECT DISTINCT
        purchase_date,
        COALESCE(TRY_CAST(ship_date AS DATE), '9999-12-31'),
        YEAR(purchase_date),
        MONTH(purchase_date)
    FROM [pc_staging].[dbo].[pc_data];
END;
GO

--10. fact table
CREATE OR ALTER PROCEDURE sp_load_pc_sales_fact
AS
BEGIN
    INSERT INTO [pc_staging].[dbo].[pc_sales_fact]
    (
        customer_id, employee_id, product_id, location_id,
        store_id, payment_id, channel_id, priority_id, date_id,
        sale_price, cost_price, discount_amount, finance_amount,
        cost_of_repairs, total_sales_per_employee,
        pc_market_price, credit_score
    )
    SELECT
        c.customer_id,
        e.employee_id,
        p.product_id,
        l.location_id,
        s.store_id,
        pm.payment_id,
        ch.channel_id,
        pr.priority_id,
        d.date_id,
        CAST(st.sale_price AS DECIMAL(10,2)),
        CAST(st.cost_price AS DECIMAL(10,2)),
        CAST(st.discount_amount AS DECIMAL(10,2)),
        CAST(st.finance_amount AS DECIMAL(10,2)),
        CAST(st.cost_of_repairs AS DECIMAL(10,2)),
        CAST(st.total_sales_per_employee AS DECIMAL(10,2)),
        CAST(st.pc_market_price AS DECIMAL(10,2)),
        st.credit_score
    FROM [pc_staging].[dbo].[pc_data] st
    INNER JOIN [pc_staging].[dbo].[dim_customer] c
        ON st.customer_name = c.first_name
    INNER JOIN [pc_staging].[dbo].[dim_employee] e
        ON st.sales_person_name = e.employee_name
       AND st.Sales_Person_Department = e.department
       AND st.Customer_Surname = c.last_name
       AND st.Customer_Contact_Number = c.contact_number
       AND st.Customer_Email_Address = c.email_address
    INNER JOIN [pc_staging].[dbo].[dim_product] p
        ON st.pc_model = p.pc_model
       AND st.pc_make = p.pc_make
       AND st.Storage_Capacity = p.storage_capacity
       AND st.Storage_Type = p.storage_type
       AND st.ram = p.ram
    INNER JOIN [pc_staging].[dbo].[dim_location] l
        ON st.Continent = l.continent
       AND st.province_or_city = l.province_or_city
       AND st.Country_or_State = l.country_or_state
    INNER JOIN [pc_staging].[dbo].[dim_store] s
        ON st.shop_name = s.shop_name
       AND st.Shop_Age = s.shop_age
    INNER JOIN [pc_staging].[dbo].[dim_payment] pm
        ON st.payment_method = pm.payment_method
    INNER JOIN [pc_staging].[dbo].[dim_channel] ch
        ON st.channel = ch.channel
    INNER JOIN [pc_staging].[dbo].[dim_priority] pr
        ON st.priority = pr.priority
    INNER JOIN [pc_staging].[dbo].[dim_date] d
        ON st.purchase_date = d.purchase_date
       AND COALESCE(TRY_CAST(st.ship_date AS DATE), '9999-12-31') = d.ship_date;
END;
GO

 --  EXECUTION
  
EXEC sp_load_dim_customer;
EXEC sp_load_dim_employee;
EXEC sp_load_dim_product;
EXEC sp_load_dim_location;
EXEC sp_load_dim_store;
EXEC sp_load_dim_payment;
EXEC sp_load_dim_channel;
EXEC sp_load_dim_priority;
EXEC sp_load_dim_date;

EXEC sp_load_pc_sales_fact;
GO

