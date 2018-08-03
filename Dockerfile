FROM debian:stretch-slim

RUN apt-get update && apt-get install -y build-essential autoconf libtool pkg-config wget git unzip curl

ENV PROTOBUF_VERSION 3.6.1

RUN mkdir /tmp/protobuf && cd /tmp/protobuf && wget https://github.com/google/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip && unzip protoc-${PROTOBUF_VERSION}-linux-x86_64.zip && chmod +x bin/protoc && cp bin/protoc /usr/local/bin/protoc && rm -rf /tmp/protoc-${PROTOBUF_VERSION}-linux-x86_64

RUN cd /tmp && mkdir grpc && git clone --recursive -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc && cd grpc && make && make install && rm -rf /tmp/grpc