FROM alpine:latest AS builder

RUN apk add alpine-sdk libmicrohttpd-dev linux-headers wget

COPY build/ /build/

WORKDIR /build/

RUN ./build.sh

FROM alpine:latest

RUN apk add libmicrohttpd

COPY --from=builder /install/ /

COPY entrypoint.sh /

ENTRYPOINT /entrypoint.sh
