FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Update dan install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ssh wget unzip nano curl python3 python3-pip tmate

# Buat direktori untuk SSH daemon
RUN mkdir /run/sshd

# Tambahkan konfigurasi tambahan dan aturan SSH
RUN echo "sleep 5" >> /openssh.sh \
    && echo "tmate -F &" >> /openssh.sh \
    && echo '/usr/sbin/sshd -D' >> /openssh.sh \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo root:147 | chpasswd \
    && chmod 755 /openssh.sh

# Expose ports
EXPOSE 80 443 3306 4040 5432 5700 5701 5010 6800 6900 8080 8888 9000

# Jalankan script SSH saat container dijalankan
CMD ["/openssh.sh"]
