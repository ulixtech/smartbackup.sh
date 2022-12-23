
# Smart Backups

Open Source Utility to take Backups For Wordpress Databases


## Installation


```bash
  -Check Root Directory Path - pwd
  cd /root-directory-of-project
  mkdir smartbackups
  mkdir /smartbackups/db
  mkdir /smartbackups/logs
  touch /smartbackups/logs/backup_log.txt
  wget https://raw.githubusercontent.com/ulixtech/smartbackup.sh/main/sbdb.sh
  chmod u+x sbdb.sh

```

## Run The Command


```bash
  /home/$USER/sbdb.sh
```

## Setup Rsync to Remote Host
```bash
  crontab -e
  0 */6 * * * /root-directory-of-project/sbdb.sh
```


## Resources

Expression Genarator : https://www.site24x7.com/tools/crontab/cron-generator.html
