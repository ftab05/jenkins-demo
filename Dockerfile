FROM ubuntu:22.04

USER root

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install a bunch of tools and languages
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
    npm \
    && rm -rf /var/lib/apt/lists/*

# Add some large files to increase image size (~100MB)
RUN wget -O /sample1.zip https://speed.hetzner.de/100MB.bin && \
    wget -O /sample2.zip https://speed.hetzner.de/100MB.bin

# Dummy app (for completeness)
RUN echo "print('Hello from heavy image')" > /hello.py

CMD ["python3", "/hello.py"]
