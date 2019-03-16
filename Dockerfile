FROM alpine:edge

RUN apk upgrade && apk --no-cache add --virtual .build-dependencies \
    cmake \
    make \
    g++ \
    git \
    && apk --no-cache add \
    mesa-gl \
    mesa-dri-intel \
    lua5.3-dev \
    lua-dev \
    ca-certificates \
    ttf-dejavu \
    qt5-qtbase-dev \
    qt5-qttools-dev \
    qt5-qtlocation-dev \
    qt5-qtserialport-dev \
    qt5-qtscript-dev \
    qt5-qtmultimedia-dev \
    && git clone --branch docker-alpine --depth 1 --recurse-submodules https://github.com/westonsteimel/stellarium \
    && cd stellarium \
    && cmake -DCMAKE_BUILD_MODE=Release . \
    && make -j2 \
    && make install \
    && cd .. \
    && rm -rf stellarium \
    && apk del .build-dependencies \
    && rm -rf /var/cache/*

ENTRYPOINT ["stellarium"]
