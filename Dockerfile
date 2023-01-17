FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

WORKDIR /code
ENV ENVIRONMENT=dev

RUN apk update && apk add libpq-dev python3-dev musl-dev gcc jpeg-dev zlib-dev

COPY requirements.txt /code/
RUN pip install -r requirements.txt

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]