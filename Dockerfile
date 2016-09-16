MAINTAINER  Andreas Linz <klingt.net@gmail.com>

# precompiled pandoc required glibc
FROM frolvlad/alpine-glibc:alpine-3.4

# enable edge repos
RUN sed -i -e 's/v3\.4/edge/g' /etc/apk/repositories

RUN apk update\
    && apk add\
    && apk add texlive-full\
    texlive-xetex\
    biber\
    make\
    rsync\
    tar\
    libarchive-tools\
    libgmp\
    curl

# install pandoc
RUN curl -Lsf 'https://github.com/jgm/pandoc/releases/download/1.17.2/pandoc-1.17.2-1-amd64.deb'\
    | bsdtar xOf - data.tar.gz\
    | tar xvz --strip-components 2 -C /usr/local
