FROM alpine

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add curl tor && \
    rm -rf /var/cache/apk/* && \
    echo 'ControlPort 0.0.0.0:9051' >> /etc/tor/torrc && \
    echo 'SocksPort 0.0.0.0:9050' >> /etc/tor/torrc && \
    echo 'TransPort 0.0.0.0:9040' >> /etc/tor/torrc && \
    rm -rf /tmp/*

EXPOSE 9050 9051

HEALTHCHECK --interval=60s --timeout=15s --start-period=20s \
    CMD curl --show-error -sx socks5h://127.0.0.1:9050 'https://check.torproject.org/api/ip' | \
        grep -qm1 -E '"IsTor"\s*:\s*true'

VOLUME ["/etc/tor", "/var/lib/tor"]

CMD ["tor"]
