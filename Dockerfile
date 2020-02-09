FROM alpine:latest

# Prepare environment
ENV FFMPEG_HOME=/opt/ffmpeg
ENV PATH=$FFMPEG_HOME:$PATH
RUN addgroup -S -g 9999 ffmpeg && \
    adduser -D -S -H -u 9999 -G ffmpeg -h $FFMPEG_HOME ffmpeg
WORKDIR $FFMPEG_HOME

# Install ffmpeg
RUN set -ex; \
    wget -nv https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz; \
    tar -xf ffmpeg-git-amd64-static.tar.xz --strip-components=1; \
    ln -sfv "${FFMPEG_HOME}/model" /usr/local/share/model; \
    rm ffmpeg-git-amd64-static.tar.xz;

ENTRYPOINT ["ffmpeg"]

