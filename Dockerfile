FROM python:3.8-alpine

WORKDIR /app

RUN pip install --upgrade pip \
    && apk add --no-cache gcc g++ musl-dev libffi-dev openssl-dev rust \
    && rm -rf /var/cache/apk/*

COPY ./requirements.txt ./requirements.txt

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del gcc g++ musl-dev libffi-dev openssl-dev rust

COPY . .

CMD python -m deegram
