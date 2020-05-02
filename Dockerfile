FROM python:3.8-alpine
RUN pip3 install gunicorn flask && mkdir /www /www/app /www/logs
COPY default.py /www/app/
COPY config.py /www/
EXPOSE 5000
#ENTRYPOINT ["gunicorn", "--accesslog", "/www/log/access.log", "--errorlog", "/www/log/debug.log", "--bind", "0.0.0.0:5000", "--workers", "$(python3 -c 'from multiprocessing import cpu_count;print(cpu_count()*2+1)')", "/www/app/default:app"]
ENTRYPOINT ["/usr/local/bin/gunicorn", "--config", "/www/config.py", "--chdir", "/www/app", "default:app"]
