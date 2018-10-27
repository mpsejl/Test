FROM alpine

RUN cd \
    && apk --no-cache add bash \
    && wget https://github.com/tsl0922/ttyd/releases/download/1.4.2/ttyd_linux.x86_64 \
    && chmod 755 ttyd_linux.x86_64 \
    && mv ttyd_linux.x86_64 /usr/local/bin/ttyd \
    && wget http://www.vintage-basic.net/downloads/vintage-basic-1.0.3-linux-x86_64.tar.gz \
    && tar -xvzf vintage-basic-1.0.3-linux-x86_64.tar.gz \
    && cp -R vintage-basic-1.0.3-linux-x86_64/bin /usr/local \
    && cp -R vintage-basic-1.0.3-linux-x86_64/share /usr/local \
    && wget http://www.vintage-basic.net/downloads/bcg.tar.gz \
    && tar -xvzf bcg.tar.gz \
    && mv bcg / \
    && chown -R nobody:nobody /bcg \
    && rm -f *.gz

ADD commands.sh /etc/profile.d/

WORKDIR bcg
EXPOSE 7681
USER nobody

ENTRYPOINT ["ttyd"]
CMD ["bash", "-l"]
