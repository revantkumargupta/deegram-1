FROM python:3.8-alpine

WORKDIR /app

RUN apk add --no-cache rust \
    && pip install --upgrade pip \
    && rm -rf /var/cache/apk/*

COPY ./requirements.txt ./requirements.txt

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del rust

COPY . .

CMD python -m deegram
