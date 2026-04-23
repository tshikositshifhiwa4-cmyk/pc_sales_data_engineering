--5. dim_store 
CREATE OR ALTER PROCEDURE sp_load_dim_store
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
    INSERT INTO [pc_staging].[dbo].[dim_store]
    (shop_name, shop_age)
    SELECT DISTINCT
        shop_name,
        shop_age
    FROM [pc_staging].[dbo].[pc_data];
END;
GO