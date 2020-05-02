FROM python:3.8-alpine
RUN pip3 install gunicorn flask && mkdir /www /www/app /www/logs
COPY default.py /www/app/
COPY config.py /www/
EXPOSE 5000
ENTRYPOINT ["/usr/local/bin/gunicorn", "--config", "/www/config.py", "--chdir", "/www/app", "default:app"]