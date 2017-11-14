FROM juanluisbaptiste/xpra-base:latest
MAINTAINER Juan Luis Baptiste <juan.baptiste@gmail.com>
ENV BTCABC_VERSION "0.16.1"
ENV BTCABC_GUI_DOWNLOAD_URL https://download.bitcoinabc.org/0.16.1/result/linux/bitcoin-abc-${BTCABC_VERSION}-x86_64-linux-gnu.tar.gz
COPY local-entrypoint.sh /

RUN apt-get update && \
    apt-get install -y curl zip libfontconfig1 libfreetype6 && \
    apt-get clean && \
    useradd -ms /bin/bash -G xpra user && \
    chmod 755 /local-entrypoint.sh

USER user
WORKDIR /home/user
RUN curl ${BTCABC_GUI_DOWNLOAD_URL} -O
RUN tar zxf bitcoin-abc-${BTCABC_VERSION}-x86_64-linux-gnu.tar.gz && \
    mv bitcoin-abc-${BTCABC_VERSION} bitcoin-abc && \
    rm bitcoin-abc-${BTCABC_VERSION}-x86_64-linux-gnu.tar.gz && \
    mkdir .bitcoin

CMD ["/local-entrypoint.sh"]
EXPOSE 10000
