#!/usr/bin/env bash

sleep 2

psql -A -h db -p 5432 -U postgres -d postgres -c "drop database bakery;"
psql -A -h db -p 5432 -U postgres -d postgres -c "create database bakery;"
psql -A -h db -p 5432 -U postgres -d bakery -f ./bakery.sql

sea-orm-playground
