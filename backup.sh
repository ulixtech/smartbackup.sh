#!/bin/bash

# Set variables
SQL_USERNAME=sf22safar_edcvfd #DB USERNAME
SQL_PASSWORD=6[X4n0EwwBEo #DB PASSWORD
SQL_HOST=localhost #DB HOST
DATABASE=sf22safar_efvcfdvc #DB DATABASE NAME
MAX_BACKUPS=8 #How Many Backup Want To Store
USER=sf22safar

#Script Variables - Not To Change
Green='\033[0;32m' 
NC='\033[0m'
RED='\033[0;31m'
BACKUP_FOLDER=/home/$USER/public_html/smartbackups/db 
LOG_FOLDER=/home/$USER/public_html/smartbackups/log

#Create backup folder if it doesn't exist
mkdir -p $BACKUP_FOLDER
mkdir -p $LOG_FOLDER

# Generate current timestamp
TIMESTAMP=$(date +%Y-%m-%d_%H_%M_%S)

# Generate backup file name
BACKUP_FILE=backup.sql

#create backup pages
touch /home/$USER/public_html/smartbackups/index.html

# - open the file in a text editor
#nano /home/$USER/public_html/smartbackups/index.html
echo "<html>
<head>
  <title>Download Backup</title>
</head>
<body>
  <h1>DOWNLOAD DB</h1>
  <a href="/smartbackups/db/backup.sql" download>
  <img src="https://img.freepik.com/premium-vector/download-button-white-background_97458-63.jpg?w=2000" alt="W3Schools">
</a>
</body>
</html>" >> /home/$USER/public_html/smartbackups/index.html




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
