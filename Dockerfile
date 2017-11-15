FROM juanluisbaptiste/xpra-base:latest
MAINTAINER Juan Luis Baptiste <juan.baptiste@gmail.com>
ENV BTCABC_VERSION "0.16.1"
ENV BTCABC_GUI_DOWNLOAD_URL https://download.bitcoinabc.org/${BTCABC_VERSION}/linux/bitcoin-abc-${BTCABC_VERSION}-x86_64-linux-gnu.tar.gz
COPY local-entrypoint.sh /

RUN apt-get update && \
    apt-get install -y curl zip libfontconfig1 libfreetype6 \
                       libegl1-mesa libgl1-mesa-glx && \
    apt-get clean && \
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
