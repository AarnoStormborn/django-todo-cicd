FROM python:3.9

COPY ./todo ./todo
COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
RUN python todo/manage.py makemigrations
RUN python todo/manage.py migrate

EXPOSE 8000

ENTRYPOINT ["python", "./todo/manage.py"]
CMD ["runserver", "0.0.0.0:8000"]