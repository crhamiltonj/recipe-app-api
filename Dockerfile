FROM python:3.7-alpine
LABEL maintainer="charlesh.io"

ENV PYTHON_UNBUFFERED 1

COPY requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client postgresql-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers build-base postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps
RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
