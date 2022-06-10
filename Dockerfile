FROM python:3.8
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
RUN mkdir /app/requirements
COPY requirements/* /app/requirements/
RUN pip3 install -r /app/requirements/base.txt

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
CMD ["python3","manage.py","runserver", "0.0.0.0:8000"]