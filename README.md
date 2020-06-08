## Wait for mysql service to become fully available

> Do not use, it's under test.

`./wait-for` is a script designed to synchronize services like docker containers. But it does not work for mysql.
I customize this script for only check mysql service. 

When using this tool, you only need to pick the `wait-for-mysql` file as part of your project, or use docker image.

## Usage

```
./wait-for-mysql host:port [-t timeout] [-u user] [-p password] [-- command args]
  -q | --quiet                        Do not output any status messages
  -t TIMEOUT | --timeout=timeout      Timeout in seconds, zero for no timeout
  -u USER | --user=user               MySQL user. Default is 'root'
  -p PASSWORD | --password=password   MySQL password
  -- COMMAND ARGS                     Execute command with args after the test finishes
```

## Examples

```
$ ./wait-for-mysql localhost:3306 -u root -p secret -- echo "DB is up"

DB is up
```

To wait for database container to become available:
```
version: '2'

services:
  db:
    image: library/mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: secret

  backend:
    build: backend
    command: sh -c './wait-for-mysql db:3306 --user=root --password=secret -- npm start'
    depends_on:
      - db
```
    
## Note

Make sure mysqladmin is installed in your machine/Dockerfile before running the command.
