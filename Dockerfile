FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    openssh-server \
    python3 \
    python3-pip \
    sudo \
    curl \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash daxo && echo "daxo:Daxo123456!@" | chpasswd && adduser daxo sudo
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
WORKDIR /app
COPY app.py /app
RUN pip3 install flask
EXPOSE 22 8000
CMD service ssh start && python3 /app/app.py
