# deepnox/python-ta-lib-pandas:2.0.2_talib0.4.26-python3.11-4_alpine3.17
# ======================================================================

## Builder

FROM deepnox/python-ta-lib:0.4.26_python3.11.4-alpine3.17 as python-builder

MAINTAINER The Deepnox Team <contact@deepnox.io

ENV PYTHON_PANDAS_VERSION "2.0.2"

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
    && adduser --disabled-password --home /app python \
    && chown -R python.python /app \
    && rm -rf /root/.cache \
              /tmp/* \
              /var/cache/apk/* \
              /var/lib/apk/lists/*

## Final image

FROM scratch

COPY --from=python-builder ["/", "/"]

WORKDIR "/app"
USER python
ENV PATH "/app/.local/bin:${PATH}"

CMD ["python3"]
