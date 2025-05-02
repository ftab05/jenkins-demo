# HeavyImageAlt.dockerfile

FROM ubuntu:22.04

USER root

ENV DEBIAN_FRONTEND=noninteractive

# Install similar but slightly different set of tools to simulate uniqueness
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-21-jdk \
    python3 \
    python3-pip \
    build-essential \
    curl \
    wget \
    git \
    unzip \
    ca-certificates \
    imagemagick \
    vlc \
    nodejs \
    npm && \
    rm -rf /var/lib/apt/lists/*

# Download large files (different names)
RUN wget -O /media_sample1.zip https://proof.ovh.net/files/100Mb.dat && \
    wget -O /media_sample2.zip https://proof.ovh.net/files/100Mb.dat

# Add a different dummy script
RUN echo "print('Hello from alternate heavy image')" > /hello_alt.py

CMD ["python3", "/hello_alt.py"]
