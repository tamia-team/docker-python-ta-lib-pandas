# 9fevrier/python-ta-lib-pandas:0.23.3-talib0.4.17-python3.7.0-alpine3.8_20180801
# ===============================================================================

FROM 9fevrier/python-ta-lib:0.4.17_python3.7.0-alpine3.8_20180730

MAINTAINER contact@9fevrier.com

ENV PYTHON_PANDAS_VERSION 0.23.3

USER root
WORKDIR /tmp

RUN apk add --no-cache --virtual .build-deps \
        musl-dev \
        gcc \
        g++ \
        make \
    && apk add --update libstdc++ \
    && pip3 install cython \
            pandas==${PYTHON_PANDAS_VERSION} \
    && apk del .build-deps \
    && rm -rf /root/.cache \
              /tmp/* \
              /var/cache/apk/* \
              /var/lib/apk/lists/*

WORKDIR /root

CMD python3