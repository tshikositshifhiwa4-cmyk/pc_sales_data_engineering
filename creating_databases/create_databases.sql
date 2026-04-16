--creating staging database
IF DB_ID('pc_staging') IS NULL
BEGIN
    CREATE DATABASE pc_staging;
END
GO

--creating warehouse database
IF DB_ID('pc_warehouse') IS NULL
BEGIN
    CREATE DATABASE pc_warehouse;
END
GO