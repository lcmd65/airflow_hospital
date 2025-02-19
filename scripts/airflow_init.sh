#!/bin/bash

echo "Aiflow init"
airflow db init

echo "Admin init"
airflow users list | grep -q "admin" || airflow users create \
    --username admin \
    --password admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email dat@workforceoptimizer.com

exec airflow webserver
