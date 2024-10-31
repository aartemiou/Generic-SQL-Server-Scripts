--
-- This script sets up a linked server on the local SQL Server instance,
-- allowing you to query data from a remote SQL Server instance.
--
-- Note: Ensure that the destination SQL instance, login credentials, and server names are correctly specified.
--       The entire operation takes place on the local SQL Server instance.
--

USE [master]
GO

-- Step 1: Create the linked server object
-- This establishes a link to the remote SQL Server instance, enabling cross-server querying.
EXEC master.dbo.sp_addlinkedserver 
    @server = N'[LinkedServerName]',                -- Name of the linked server
    @srvproduct = N'', 
    @provider = N'SQLNCLI',                         -- Provider for SQL Native Client
    @datasrc = N'[DestSQLInstanceName]'             -- Destination SQL Server instance
GO

-- Step 2: Set up user mapping between local and remote instances
-- Maps a local login to a remote login, providing necessary credentials for access.
EXEC master.dbo.sp_addlinkedsrvlogin 
    @rmtsrvname = N'[LinkedServerName]',            -- Name of the linked server
    @useself = N'False',                            -- Do not use the local login's credentials
    @locallogin = N'[LocalLogin_SQL_or_Windows]',   -- Local login (SQL or Windows) to map
    @rmtuser = N'[Remote_SQL_Login_Name]',          -- Remote SQL login name
    @rmtpassword = '[Remote_SQL_Login_Password]'    -- Remote SQL login password
GO

-- Step 3: Query a remote table through the linked server
-- Example query to retrieve data from a remote table using the linked server.
SELECT * 
FROM [LinkedServerName].[Database_Name].[Schema_Name].[Table_Name];
