--4. dim_location
CREATE OR ALTER PROCEDURE sp_load_dim_location
AS
BEGIN
    TRUNCATE TABLE [pc_staging].[dbo].[dim_product];
    INSERT INTO [pc_staging].[dbo].[dim_location]
    (continent, country_or_state, province_or_city)
    SELECT DISTINCT
        continent,
        country_or_state,
        province_or_city
    FROM [pc_staging].[dbo].[pc_data];
END;
GO