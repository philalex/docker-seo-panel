# docker-seo-panel
Docker for Seo Panel (https://github.com/sendtogeo/Seo-Panel)

First run mysql:
```
docker run --name mysqlseopanel -d -e MYSQL_DATABASE=seo-panel -e MYSQL_ROOT_PASSWORD=My3l1tP4S50rD -ti mysql:5.5.42
```

and run seo-panel
```
docker run -p 8080:80 --name seopanel --link mysqlseopanel:mysqlseopanel -ti philalex/docker-seo-panel
```
and you will see mysql informations to use in seopanel
```
Database: seo-panel
User: root
Password: My3l1tP4S50rD
Host: 172.17.XXX.XXX
```

You can now use seo-panel on port 8080

If you want persistent volume for mysql use:
```
docker run --name mysqlseopanel -d -v=/PATH:/var/lib/mysql -e MYSQL_DATABASE=seo-panel -e MYSQL_ROOT_PASSWORD=tototo -ti mysql:5.5.42
```