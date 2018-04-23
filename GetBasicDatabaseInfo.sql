/*
-- This T-SQL script helps you retrieve useful 
-- information about the databases in as SQL Server instance.
*/
SELECT name AS DatabaseName, 
	(DATABASEPROPERTYEX(name, 'Status')) AS [Status],
	DATABASEPROPERTYEX(name, 'Collation') AS Collation,
	CASE WHEN DATABASEPROPERTYEX(name, 'Recovery')='FULL' THEN 'Full Recovery Model'
		WHEN DATABASEPROPERTYEX(name, 'Recovery')='BULK_LOGGED' THEN 'Bulk Logged Model'
		WHEN DATABASEPROPERTYEX(name, 'Recovery')='SIMPLE' THEN 'Simple Recovery Model'
	END AS [RecoveryModel],
	compatibility_level AS CompatibilityLevel , 
	CASE compatibility_level
		WHEN 65  THEN 'SQL Server 6.5'
		WHEN 70  THEN 'SQL Server 7.0'
		WHEN 80  THEN 'SQL Server 2000'
		WHEN 90  THEN 'SQL Server 2005'
		WHEN 100 THEN 'SQL Server 2008/R2'
		WHEN 110 THEN 'SQL Server 2012'
		WHEN 120 THEN 'SQL Server 2014'
		WHEN 130 THEN 'SQL Server 2016'
		WHEN 140 THEN 'SQL Server 2017'
		ELSE 'Unknown - '+CONVERT(varchar(10),compatibility_level)
	END AS CompatibilityLevelVersion,
	CASE WHEN DATABASEPROPERTYEX(name, 'IsAutoShrink')=1 THEN 'Enabled'
		WHEN DATABASEPROPERTYEX(name, 'IsAutoShrink')=0 THEN 'Dissabled'
	END AS AutoShrink
FROM sys.databases
