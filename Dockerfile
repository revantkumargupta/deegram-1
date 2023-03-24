FROM python:3.8-alpine

WORKDIR /app

COPY ./requirements.txt ./requirements.txt

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache gcc g++ musl-dev libffi-dev openssl-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del gcc g++ musl-dev libffi-dev openssl-dev

COPY . .

CMD python -m deegram
