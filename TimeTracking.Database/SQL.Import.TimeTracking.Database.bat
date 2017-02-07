echo off
set folder=.\
set targetDb=TimeTracking

set pf=C:\Program Files (x86)\Microsoft SQL Server\120\DAC\bin\

echo About to Delete TimeTracking on Local DB Server
Sqlcmd -S localhost -Q "ALTER DATABASE %targetDb% SET SINGLE_USER WITH ROLLBACK IMMEDIATE"
sqlcmd -S localhost -Q "DROP DATABASE %targetDb%"

echo About to Import TimeTracking to Local DB Server
"%pf%SqlPackage.exe" /a:Import /tsn:"localhost" /tdn:"%targetDb%" /sf:"%folder%%targetDb%.bacpac"

pause