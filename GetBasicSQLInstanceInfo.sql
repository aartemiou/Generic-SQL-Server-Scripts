/*
-- This T-SQL script helps you retrieve useful 
-- information about SQL Server instances.
*/
SELECT
SERVERPROPERTY('ServerName') AS FullInstanceName,
(SELECT ISNULL(local_net_address,'N/A') FROM sys.dm_exec_connections WHERE session_id = @@SPID) AS SQLServerIP,
(SELECT ISNULL(CAST(local_tcp_port AS VARCHAR(10)),'N/A') FROM sys.dm_exec_connections WHERE session_id = @@SPID) AS SQLServerPort,
REPLACE(SUBSTRING(@@version,0,CHARINDEX('(',@@version)),'Microsoft ','') as FullSQLVersion,
SERVERPROPERTY('ProductVersion') AS ProductVersion,
SERVERPROPERTY('ProductLevel') AS ProductLevel,
SERVERPROPERTY('ComputerNamePhysicalNetBIOS') AS ComputerNamePhysicalNetBIOS,
SERVERPROPERTY('MachineName') AS MachineName,
SERVERPROPERTY('InstanceName') as InstanceName,
SERVERPROPERTY('BuildClrVersion') AS BuildClrVersion,
SERVERPROPERTY('Collation') AS Collation,
SERVERPROPERTY ('edition') as InstanceEdition,
CASE WHEN SERVERPROPERTY('EngineEdition')=1 THEN 'Personal/Desktop' 
   WHEN SERVERPROPERTY('EngineEdition')=2 THEN 'Standard' 
   WHEN SERVERPROPERTY('EngineEdition')=3 THEN 'Enterprise' 
   WHEN SERVERPROPERTY('EngineEdition')=4 THEN 'Express' 
   WHEN SERVERPROPERTY('EngineEdition')=5 THEN 'SQL Database' 
   WHEN SERVERPROPERTY('EngineEdition')=6 THEN 'SQL Data Warehouse' 
END AS EngineEdition,
CASE WHEN SERVERPROPERTY('IsClustered')=1 THEN 'Clustered'
    WHEN SERVERPROPERTY('IsClustered')=0 THEN 'Not Clustered'
   ELSE 'N/A' END AS ClusteredStatus,
(SELECT COUNT(*) FROM sys.databases) AS TotalDatabases
