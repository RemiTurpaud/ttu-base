# Superset & Teradata
[Superset](https://github.com/apache/incubator-superset) docker image with Teradata database drivers. 
Uses the [Teradata Dialect for SQL Alchemy](https://github.com/Teradata/sqlalchemy-teradata).
Currently only supports SQLite database backend for superset metadata.

## Image build
* Clone or Download this repository.
* Download the [Teradata ODBC Drivers for Linux](http://downloads.teradata.com/download/connectivity/odbc-driver/linux) (you will need to register and accept the licence terms). And place the tar.gz file in this directory.
* Download the [Teradata Tools and Utilities - Linux Installation Packag](http://downloads.teradata.com/download/tools/teradata-tools-and-utilities-linux-installation-package-0) (you will need to register and accept the licence terms). And place the tar.gz file in this directory.
* Navigate to this directory and build the Docker image: 

`docker build -t ttu-td .`

## Backend Persistence
To persist the backend and application configuration, mount a volume to the `/superset` point.
If not found, the default Superset application and database backend will be deployed to this volume.

`docker run -it --name superset-td   -v /tmp/superset:/superset:z   -p 8088:8088 superset-td`

## Getting started
* Open a web browser and point to the superset application at `<hostname>:<port>`. E.g. http://localhost:8088
 (Default on a local deployment)
* Login with the admin user and password. See defaults in [config file](admin.cfg).
* Create the database connection:
    * Go to Sources>Databases and click "Add a new record". E.g. http://localhost:8088/databaseview/add.
    * Enter a name for the Database connection.
    * Specify the [SQLAlchemy URL](http://docs.sqlalchemy.org/en/rel_1_0/core/engines.html#database-urls), specifying 'teradata' for the dialect. E.g `teradata://user:password@192.168.123.123/dbc`.
    * You may want to check "Expose in SQL Lab" to directly write queries in the SQL lab.
    * Test/Save connection.
* Import tables/views:
    * Go to Sources>Tables and click "Add a new record". E.g. http://localhost:8088/tablemodelview/add.
    * Select the database connection, schema (e.g. 'dbc'), table (e.g. 'tables').
    * Click save and click on the table name to start editing a slice!
