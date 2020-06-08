#!/bin/sh
set -e

#nc -z localhost 3306
#echo $?
#
exec timeout -t 3 mysqladmin status --protocol tcp --host localhost --port 3306 --user root --password=local
echo $?
