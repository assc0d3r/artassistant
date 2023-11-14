FROM python:3.8-slim-buster
#FROM anasty17/mltb:latest
RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /LUCIFER
WORKDIR /LUCIFER
COPY start.sh /start.sh
COPY app.py /app.py
CMD ["gunicorn app:app & start.sh"]
#CMD ["/bin/bash", "/start.sh"]
