# 9fevrier/python-ta-lib-pandas:0.23.4-talib${PYTHON_TALIB_VERSION}-python3.6.6-alpine3.8_20190114
# ===============================================================================

FROM python:3.6.6-alpine3.8 as python-pandas-builder

MAINTAINER contact@9fevrier.com

ENV PYTHON_PANDAS_VERSION "0.23.4"

USER root
WORKDIR /tmp

RUN apk add --no-cache --virtual .build-deps \
       alpine-sdk \
    && apk add --no-cache --update libstdc++ \
    && pip3 install cython \
            pandas==${PYTHON_PANDAS_VERSION} \
    && apk del .build-deps \
    && rm -rf /root/.cache \
              /tmp/* \
              /var/cache/apk/* \
              /var/lib/apk/lists/*

WORKDIR /root

FROM python:3.6.6-alpine3.8  

MAINTAINER contact@9fevrier.com

ENV PYTHON_TALIB_VERSION "0.4.17"

RUN apk add --no-cache --update libstdc++
COPY --from=python-pandas-builder ["/usr/local/lib/python3.6/site-packages/Cython", "/usr/local/lib/python3.6/site-packages/Cython"]
COPY --from=python-pandas-builder ["/usr/local/lib/python3.6/site-packages/numpy", "/usr/local/lib/python3.6/site-packages/numpy"]
COPY --from=python-pandas-builder ["/usr/local/lib/python3.6/site-packages/pandas", "/usr/local/lib/python3.6/site-packages/pandas"]
COPY --from=python-pandas-builder ["/usr/local/lib/python3.6/site-packages/dateutil", "/usr/local/lib/python3.6/site-packages/dateutil"]
COPY --from=python-pandas-builder ["/usr/local/lib/python3.6/site-packages/pytz", "/usr/local/lib/python3.6/site-packages/pytz"]
COPY --from=python-pandas-builder ["/usr/local/lib/python3.6/site-packages/six*", "/usr/local/lib/python3.6/site-packages/"]
COPY --from=9fevrier/python-ta-lib:0.4.17_python3.6.6-alpine3.8 ["/usr/local/lib/python3.6/site-packages/talib", "/usr/local/lib/python3.6/site-packages/talib"]
COPY --from=9fevrier/python-ta-lib:0.4.17_python3.6.6-alpine3.8 ["/usr/lib/libta_lib*", "/usr/lib/"]


CMD ["python3"]
