--
-- sqlplus sys/root as sysdba
CREATE USER $OOZIEUSER IDENTIFIED BY $OOZIEPASSWORD;
GRANT ALL PRIVILEGES TO $OOZIEUSER;
GRANT CONNECT, RESOURCE TO $OOZIEUSER;
QUIT;
