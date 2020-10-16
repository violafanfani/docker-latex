FROM  debian:buster-slim

LABEL org.opencontainers.image.title="latex"
LABEL org.opencontainers.image.description="A full TexLive image ready to use with VScode."
LABEL org.opencontainers.image.url="https://github.com/stracquadaniolab/docker-latex"
LABEL org.opencontainers.image.documentation="https://github.com/stracquadaniolab/docker-latex"
LABEL org.opencontainers.image.source="https://github.com/stracquadaniolab/docker-latex"
LABEL org.opencontainers.image.revision="v0.1.0"
LABEL org.opencontainers.image.vendor="stracquadaniolab"
LABEL org.opencontainers.image.authors="Giovanni Stracquadanio"


# copy package list
COPY pkg.list .

# Install basic tools
RUN apt-get update \
    && apt-get install --yes $(cat pkg.list) \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash"]