FROM node:20-bookworm

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt upgrade -y && apt install -y \
    openssh-server git wget sudo nano curl tmate python3 python3-pip build-essential \
    && rm -rf /var/lib/apt/lists/*
# Buat startup script
RUN mkdir /run/sshd \
    && echo "sleep 5" > /openssh.sh \
    && echo "tmate -F &" >> /openssh.sh \
    && echo "/usr/sbin/sshd -D" >> /openssh.sh \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "root:147" | chpasswd \
    && chmod +x /openssh.sh
# Jalankan script pakai bash (anti 'exec format error')
CMD ["bash", "/openssh.sh"]
