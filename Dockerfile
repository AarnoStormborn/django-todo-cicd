FROM python:3.9

WORKDIR /app

COPY ./todo /app/todo
COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python", "todo/manage.py", "runserver", "0.0.0.0:8000"]