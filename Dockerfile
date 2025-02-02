FROM alpine:3.5
LABEL maintainer "MrFastwind@github.io"
LABEL description "Anonymous Samba Server"

RUN apk --no-cache add \
    samba \
    samba-common-tools \
    && mkdir -p /data/shared \
    && chmod 777 /data/shared \
    && chown nobody:nogroup /data/shared

VOLUME ["/data"]

WORKDIR /

COPY smb.conf /etc/samba/smb.conf
COPY --chmod=0777 entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

EXPOSE 445

ENTRYPOINT ["/bin/sh","/entrypoint.sh"]
