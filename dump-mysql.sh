#!/bin/env bash
# dirty little scipt to dump a MySQL database.  assumes user and
# database have the same name
mysqldump -u $1  --databases $1 -p > $1-mysql-dump.sql
