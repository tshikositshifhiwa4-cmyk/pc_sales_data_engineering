-- 3. dim_product
CREATE OR ALTER PROCEDURE sp_load_dim_product
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
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
