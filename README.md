## gunicorn-simple



1. Build the image

```bash
$ docker build -t gunicorn-simple:latest .
```
2. Pull the nginx image
```bash
$ docker pull nginx:1.15.7-alpine
```
3. Create network
```bash
$ docker network create -d bridge webserv-net
```
4. Run
```bash
$ docker run -itd --name gunsimple --network webserv-net gunicorn-simple:latest
$ docker run -itd -p 80:80 --name nginx --network webserv-net nginx:1.15.7-alpine
```

5. Set nginx
```bash
$ docker exec -it nginx /bin/sh
```
```
/etc/nginx/conf.d # cat default.conf 
server {
    listen       80;
    server_name  localhost;

    location / {
        proxy_pass http://gunsimple:5000;
		proxy_redirect     off;
    }
}

```