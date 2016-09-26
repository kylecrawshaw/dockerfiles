FROM ubuntu

MAINTAINER kyle.crawshaw@gmail.com

RUN apt-get update && \
    apt-get install -y git build-essential g++ cpio autoconf libxml2-dev libcurl4-openssl-dev libssl-dev libbz2-dev liblzma-dev

RUN git clone https://github.com/hogliux/bomutils && \
    cd bomutils && \
    make && \
    make install

RUN git clone https://github.com/mackyle/xar.git && \
    cd xar/xar && \
    ./autogen.sh && \
    ./configure --with-bzip2 --with-lzma=/usr && \
    make && \
    make install


COPY build_pkg.sh /run.sh
RUN chmod +x /run.sh

WORKDIR /pkg

CMD /run.sh
