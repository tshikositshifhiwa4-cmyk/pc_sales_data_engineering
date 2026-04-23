--8. dim_priority 
CREATE OR ALTER PROCEDURE sp_load_dim_priority
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
    INSERT INTO [pc_staging].[dbo].[dim_priority]
    (priority)
    SELECT DISTINCT
        priority
    FROM [pc_staging].[dbo].[pc_data];
END;
GO