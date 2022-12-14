FROM python:3

ENV PYTHONUNBUFFER 1
RUN mkdir /code
RUN apt-get update && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/

CMD ["sh", "-c", "python manage.py makemigrations api && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
