#!/bin/bash
today=$(date +"%Y-%m-%d-%H:%M:%S")
pg_dump -F t admin_development > "./backups/${today}.tar"
