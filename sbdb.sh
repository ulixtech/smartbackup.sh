#!/bin/bash

# Set variables
SQL_USERNAME=bongohunt_efwe57 #DB USERNAME
SQL_PASSWORD=8dvDqO65CT #DB PASSWORD
SQL_HOST=localhost #DB HOST
DATABASE=bongohunt_bhoh30 #DB DATABASE NAME
MAX_BACKUPS=8 #How Many Backup Want To Store

#Script Variables - Not To Change
Green='\033[0;32m' 
NC='\033[0m'
RED='\033[0;31m'
BACKUP_FOLDER=/home/$USER/smartbackups/db 
LOG_FOLDER=/home/$USER/smartbackups/log

#Create backup folder if it doesn't exist
mkdir -p $BACKUP_FOLDER
mkdir -p $LOG_FOLDER

# Generate current timestamp
TIMESTAMP=$(date +%Y-%m-%d_%H_%M_%S)

# Generate backup file name
BACKUP_FILE=$DATABASE-$TIMESTAMP.sql


# Generate backup
mysqldump --add-drop-table -u $SQL_USERNAME -p$SQL_PASSWORD -h $SQL_HOST $DATABASE > $BACKUP_FOLDER/$BACKUP_FILE 2>&1


# List old backups
DELETED_BACKUPS=$(ls -t $BACKUP_FOLDER/$DATABASE-*.sql | tail -n +$((MAX_BACKUPS+1)))
#Delete Old Backup
rm -r $DELETED_BACKUPS

#Delet Log
echo "$DELETED_BACKUPS | Database Removed Successfully $(date)" >> $LOG_FOLDER/deleted_backups.txt

#backup Log
echo "$BACKUP_FILE | Database backup created at $(date)" >> $LOG_FOLDER/backup_log.txt

#Terminal Output
echo  -e "${Green}$BACKUP_FILE | Database backup created at $(date)${NC}"
echo -e "${RED}$DELETED_BACKUPS | Database Removed Successfully $(date)${NC}"

# Delete old backups
#ls -t $BACKUP_FOLDER/$DATABASE-*.sql | tail -n +$((MAX_BACKUPS+1)) | xargs -d '\n' rm


