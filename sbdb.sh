#!/bin/bash
# Variable
NOW=$(date +%d-%m-%Y-%H-%M)
SQL_BACKUP=${NOW}_database.sql
FILES_BACKUP=${NOW}_files.tar.gz
DB_BACKUP_FILE_ROOT=/home/$USER/smartbackups/db
Logpath=/home/$USER/smartbackups/logs/backup_log.txt

DB_NAME="sangbadonline_wp_g8ig6" #Replace DB_NAME
DB_USER="sangbadonline_wp_rafqr" #Replace DB_USER
DB_PASSWORD="05nMQCKhB23#pQ%$" #Replace DB_Password
DB_HOST="localhost"

# Backup database
mysqldump --add-drop-table -u$DB_USER -p$DB_PASSWORD -h$DB_HOST $DB_NAME > $DB_BACKUP_FILE_ROOT/$SQL_BACKUP 2>&1


#Log
echo "$SQL_BACKUP | Database backup created at $(date)" >> $Logpath

echo "$SQL_BACKUP | Database backup created at $(date)"