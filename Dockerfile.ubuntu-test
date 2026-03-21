FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    apt-get update && apt-get install -y sudo tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Copiar el repositorio al container
COPY . /root/.dotfiles
WORKDIR /root/.dotfiles

# Asegurar permisos de ejecución
RUN chmod +x install.sh

# Ejecutar el script. 'yes s' alimenta la respuesta 's' para instalar dependencias.
CMD yes s | ./install.sh
