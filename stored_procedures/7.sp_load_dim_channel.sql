--7. dim_channel
CREATE OR ALTER PROCEDURE sp_load_dim_channel
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
    INSERT INTO [pc_staging].[dbo].[dim_channel]
    (channel)
    SELECT DISTINCT
        channel
    FROM [pc_staging].[dbo].[pc_data];
END;
GO