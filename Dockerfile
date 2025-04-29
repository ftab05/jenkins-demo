FROM ubuntu:22.04

USER root

ENV DEBIAN_FRONTEND=noninteractive

# Install a bunch of common heavy packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jdk \
    python3 \
    python3-pip \
    build-essential \
    curl \
    wget \
    git \
    unzip \
    ca-certificates \
    ffmpeg \
    nodejs \
    npm && \
    rm -rf /var/lib/apt/lists/*

# Download large test files (~200MB total)
RUN wget -O /sample1.zip https://proof.ovh.net/files/100Mb.dat && \
    wget -O /sample2.zip https://proof.ovh.net/files/100Mb.dat

# Add a dummy script
RUN echo "print('Hello from heavy image')" > /hello.py

CMD ["python3", "/hello.py"]
