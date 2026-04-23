-- 1. dim_customer 
CREATE OR ALTER PROCEDURE sp_load_dim_customer
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
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