FROM debian

RUN apt-get update && apt install python3 python3-pip  python3-flask-cors wget curl git unzip sudo -y

WORKDIR /opt

COPY ars0n-framework/ .

RUN mkdir -p /root/.keys/
RUN echo 'export SLACK_TOKEN=""' > /root/.keys/keystore
RUN echo 'export GITHUB_PAT=""' >> /root/.keys/keystore
RUN echo 'export SHODAN_API_KEY=""' >> /root/.keys/keystore
RUN echo 'export HACKERONE_USER=""' >> /root/.keys/keystore
RUN echo 'export HACKERONE_API_KEY="T"' >> /root/.keys/keystore

RUN python3 install.py

CMD chmod 777 run.sh && ./run.sh
