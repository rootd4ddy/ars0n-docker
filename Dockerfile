FROM debian:bullseye

WORKDIR /app

COPY ars0n-framework/ .

RUN apt-get update && apt-get install -y python3 python3-pip

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

RUN pip install -r requirements.txt

CMD [ "python3", "install.py" ]