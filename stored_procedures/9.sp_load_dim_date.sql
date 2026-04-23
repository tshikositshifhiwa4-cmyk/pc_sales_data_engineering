--9. dim_date 
CREATE OR ALTER PROCEDURE sp_load_dim_date
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
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
