Installation Procedure

1. Install PostgreSQL.

2. Load schema "pbeissert" into a database with the Restore-Tool of pgAdmin.

3. Edit the database.yml-file in the config-folder of this folder and edit the database-conenction
   according to your specifications

4. Run the RailsInstaller.

5. Open command prompt "cmd" and browse to the directory of this folder and type "rails s" and press enter.
   For example  "C:\ghg_rails\rails s"
   
6. You will be asked to run bundle installer. Run the bundle installer to install necessary gems.

7. Run "rails s" again to start the local server environment.

8. Open your browser and access the application via locolhost:3000

Remark: As this version is provided with empty data-tables inside database-schema functionality will be limited.
