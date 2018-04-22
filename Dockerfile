FROM xataz/alpine:3.7

LABEL description="medusa based on alpine" \
      tags="latest" \
      maintainer="xataz <https://github.com/xataz>" \
      build_ver="201804220600" \
      commit="77b20916ab577b82112ebc624f816054788c63f2"

ENV MEDUSA_WEBROOT="/" \
    MEDUSA_ENCRYPTION_VERSION=0 \
    MEDUSA_TVDIRS="/data/Media/TV" \
    UID="991" \
    GID="991"

RUN apk add --no-cache python \
                git \
                s6 \
                su-exec \
                unrar \
                libmediainfo \
    && cd /tmp \
    && mkdir -p /config/Medusa \
    && git clone https://github.com/pymedusa/Medusa /app/Medusa \
    && rm -rf /app/Medusa/.git

COPY rootfs /
RUN chmod +x /usr/local/bin/startup

VOLUME ["/config/Medusa"]
EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["/bin/s6-svscan", "/etc/s6.d"]
