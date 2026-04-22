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