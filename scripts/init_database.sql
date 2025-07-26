/*
============================================
Database Setup: DataWarehouse with 3-Layer Schema
============================================

Creates a fresh DataWarehouse database with three standard schemas:
1. bronze - Raw/landing zone
2. silver - Cleaned/processed data  
3. gold - Business-ready analytics data

WARNING: This will DROP existing DataWarehouse!
*/

-- Database creation with forced cleanup
USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force disconnect all users before drop
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
    PRINT 'Existing DataWarehouse database dropped';
END
GO

CREATE DATABASE DataWarehouse;
PRINT 'New DataWarehouse database created';
GO

-- Schema setup
USE DataWarehouse;
GO

CREATE SCHEMA bronze;   -- Raw source data layer
CREATE SCHEMA silver;   -- Transformed/validated data
CREATE SCHEMA gold;     -- Business-facing dimensional models
PRINT 'Bronze/Silver/Gold schemas created';
GO
