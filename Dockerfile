FROM xataz/alpine:3.6

LABEL description="medusa based on alpine" \
      tags="latest" \
      maintainer="xataz <https://github.com/xataz>" \
      build_ver="2017090801"

ARG MEDIAINFO_VER=0.7.95

ENV MEDUSA_WEBROOT="/" \
    MEDUSA_ENCRYPTION_VERSION=0 \
    MEDUSA_TVDIRS="/data/Media/TV" \
    UID="991" \
    GID="991"

RUN export BUILD_DEPS="build-base \
                        libtool \
                        automake \
                        autoconf \
                        wget" \
    && apk add --no-cache python \
                git \
                s6 \
                su-exec \
                unrar \
                ${BUILD_DEPS} \
    && cd /tmp \
    && wget http://mediaarea.net/download/binary/libmediainfo0/${MEDIAINFO_VER}/MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && tar xzf MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && cd /tmp/MediaInfo_DLL_GNU_FromSource \
    && ./SO_Compile.sh \
    && cd /tmp/MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library \
    && make install \
    && cd /tmp/MediaInfo_DLL_GNU_FromSource/MediaInfoLib/Project/GNU/Library \
    && make install \
    && mkdir -p /config/Medusa \
    && git clone https://github.com/pymedusa/Medusa /app/Medusa \
    && apk del --purge ${BUILD_DEPS} \
    && rm -rf /tmp/* /app/Medusa/.git

COPY rootfs /
RUN chmod +x /usr/local/bin/startup

VOLUME ["/config/Medusa"]
EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["/bin/s6-svscan", "/etc/s6.d"]
