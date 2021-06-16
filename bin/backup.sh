#!/bin/bash
today=$(date +"%Y-%m-%d-%Hh%Mm%Ss")
echo "Backing up database to ./backups/${today}.tar"
pg_dump -F t admin_development > "./backups/${today}.tar"
