FROM google/cloud-sdk:264.0.0-alpine@sha256:f99b0f118cc67a8a6696f2c6c65dea2c92d82dd45c29f4ca357448a681cf4d88

ADD . /app
WORKDIR /app
RUN gcloud components install gsutil kubectl && \
    apk del python && \
    apk add --no-cache py3-setuptools && \
    pip3 install -r requirements.txt && \
    python3 setup.py install
ENV TZ UTC
CMD ["k8s-snapshots"]
