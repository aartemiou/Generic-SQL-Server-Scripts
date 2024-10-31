# Generic-SQL-Server-Scripts

Useful SQL Server Scripts for database administration.

This repository contains a collection of SQL Server scripts designed to assist with various database administration tasks, including retrieving basic information about databases and instances, as well as setting up linked servers.

## Contents

### 1. `CreateSimpleLinkedServer.sql`
   - **Description**: A script to create a linked server in SQL Server, allowing users to set up connections to remote SQL Server instances.
   - **Usage**: Run this script to add a linked server configuration in the local SQL Server instance. It includes options for specifying the remote SQL instance and login credentials.

### 2. `GetBasicDatabaseInfo.sql`
   - **Description**: Retrieves basic information about all databases on the SQL Server instance, such as database name, size, and status.
   - **Usage**: Useful for obtaining an overview of the databases hosted on a server. Simply execute this script in SQL Server Management Studio (SSMS) to view information about each database on the instance.

### 3. `GetBasicSQLInstanceInfo.sql`
   - **Description**: Gathers general information about the SQL Server instance, including version details, instance name, and other configuration parameters.
   - **Usage**: Run this script in SSMS to get a quick summary of the SQL Server instance's settings and specifications. Ideal for documentation or troubleshooting.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Author

Created by [Artemakis Artemiou](https://github.com/aartemiou), a Data & AI expert with extensive experience in SQL Server and database management.

## Notes

- These scripts are intended for SQL Server instances and may require modifications for compatibility with other versions or environments.
- Test scripts in a development environment before running them on production systems.

---

This repository is actively maintained, and new SQL Server scripts will be added periodically. Stay tuned!
