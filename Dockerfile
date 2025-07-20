# Usa Ubuntu 24.04 como base
FROM ubuntu:24.04

# Actualiza paquetes, instala SSH, Python y sudo
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openssh-server python3 sudo \
 && rm -rf /var/lib/apt/lists/*

# Crea el usuario Ansible con contraseña “ansible” y dale permisos sudo
RUN useradd -ms /bin/bash ansible \
 && echo 'ansible:ansible' | chpasswd \
 && adduser ansible sudo

# Prepara SSH
RUN mkdir /var/run/sshd

# Expone el puerto 22 y arranca el demonio SSH
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
