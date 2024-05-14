#!/bin/bash

export PGUSER=postgres
psql <<- SHELL
  CREATE DATABASE "adventureworks";
  CREATE DATABASE "northwind";
  GRANT ALL PRIVILEGES ON DATABASE "adventureworks" TO postgres;
  GRANT ALL PRIVILEGES ON DATABASE "northwind" TO postgres;
SHELL
cd /data
psql -d adventureworks -U postgres < /data/install.sql
psql -d northwind -U postgres < /data/northwind.sql
