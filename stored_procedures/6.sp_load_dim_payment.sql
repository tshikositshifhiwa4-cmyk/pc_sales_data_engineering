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