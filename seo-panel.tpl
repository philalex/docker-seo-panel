server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        server_name {{ DOMAIN_NAME| default("www.acme.com") }};
	root  /srv/www/Seo-Panel;
        index index.php;

	# Logging --
	access_log  /var/log/nginx/{{ DOMAIN_NAME| default("www.acme.com") }}.access.log;
	error_log  /var/log/nginx/{{ DOMAIN_NAME| default("www.acme.com") }}.error.log notice;

        # serve static files directly
        location ~* ^.+.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt)$ {
            access_log        off;
            expires           max;
        }
 
        location ~ \.php$ {
		 try_files $uri =404;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                include /etc/nginx/fastcgi_params;
        }
}