# 9fevrier/python-ta-lib-pandas:1.4.3-talib0.4.24_python3.10.6-alpine3.16
# =======================================================================

FROM deepnox/python-ta-lib:0.4.24_python3.10_alpine3.16

MAINTAINER The Deepnox Team <contact@deepnox.io

ENV PYTHON_PANDAS_VERSION "1.4.3"

USER "root"
WORKDIR "/tmp"

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

WORKDIR "/root"

CMD ["python3"]
