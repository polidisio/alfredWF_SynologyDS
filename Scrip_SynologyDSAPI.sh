#NAS SERVER 
NAS="http://hostname:port"
# Username 
USER="USER"
# Password for authentificate user
PASS="PASS"
##Control Download Station Api
echo "Download Station Api Control..."
curl -I -v "$NAS/webapi/query.cgi?api=SYNO.API.Info&version=1&method=query&query=SYNO.API.Auth,SYNO.DownloadStation.Task"
##Authentification Download Station Api and save cookie for request 
echo "Authetification Download Station"
curl -I -v -c cookies.txt "$NAS/webapi/auth.cgi?api=SYNO.API.Auth&version=3&method=login&account=admin&passwd=analgilasa&session=FileStation&format=cookie" 
##Request upload torrent hotfolder
echo "$uri"
curl -v -b cookies.txt -H -X -d "api=SYNO.DownloadStation.Task&version=1&method=create&uri=URL"   $NAS/webapi/DownloadStation/task.cgi
##Close Session
echo "close session..."
curl -I -v "$NAS/webapi/auth.cgi?api=SYNO.API.Auth&version=1&method=logout&session=DownloadStation" 