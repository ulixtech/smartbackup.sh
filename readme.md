
# Smart Backups

Open Source Utility to take Backups For Wordpress Databases


## Installation


```bash

  wget https://raw.githubusercontent.com/ulixtech/smartbackup.sh/main/sbdb.sh
  chmod u+x sbdb.sh

```

## Run The Command


```bash
  /home/$USER/sbdb.sh
```

## Setup Rsync to Remote Host
```bash
  echo "0 */4 * * * /home/$USER/sbdb.sh" | crontab
```

## Features

- Tested With Cpanel Only 
- Will Work With Any Unix Based System 

## Resources

Expression Genarator : https://www.site24x7.com/tools/crontab/cron-generator.html
