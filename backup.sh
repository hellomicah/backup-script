DATE=$(date +%Y-%m-%d)
echo $DATE

#the brand name
BRAND=""

#website (wordpress) diretory in /var/www/html
BRANDDIR=""

#your home directory
HOMEDIR=""

#MySQL username
USERNAME=""

#MySQL password
PASSWORD=""

#MySQL database
DATABASE=""


mysqldump -u$USERNAME -p$PASSWORD $DATABASE >> /home/$HOMEDIR/$BRAND_WP_database_$DATE.sql
echo "...done mysqldump for $BRAND databases"

cd /var/www/html
tar -cvf /home/$HOMEDIR/$BRAND_website_$DATE.tar $BRANDDIR
echo "...creating tarball for $BRAND website"

cd /home/$HOMEDIR
gzip $BRAND_website_$DATE.tar
echo "...gzip tarball for $BRAND website"
