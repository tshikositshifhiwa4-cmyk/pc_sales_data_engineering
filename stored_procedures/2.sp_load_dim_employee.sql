--2. dim_employee
CREATE OR ALTER PROCEDURE sp_load_dim_employee
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
    INSERT INTO [pc_staging].[dbo].[dim_employee]
    (employee_name, department)
    SELECT DISTINCT
        Sales_Person_Name,
        Sales_Person_Department
    FROM [pc_staging].[dbo].[pc_data];
END;
GO