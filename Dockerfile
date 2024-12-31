FROM python:3.10.14

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt


COPY . .

COPY start.sh /start.sh
RUN apt-get update && apt-get install -y postgresql-client
RUN chmod +x /start.sh

EXPOSE 8000

CMD ["/start.sh"]
