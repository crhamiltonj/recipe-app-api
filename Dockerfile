FROM python:3.7-alpine
LABEL maintainer="charlesh.io"

ENV PYTHON_UNBUFFERED 1

COPY requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client postgresql-dev gcc \
    libc-dev linux-headers build-base jpeg-dev musl-dev zlib zlib-dev \
    postgresql-dev python3-dev
# RUN apk add --update --no-cache --virtual .tmp-build-deps \
#     postgresql-dev \
#     python3-dev musl-dev
RUN pip install -r /requirements.txt
# RUN apk del .tmp-build-deps
RUN mkdir /app
WORKDIR /app
COPY ./app /app
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user
