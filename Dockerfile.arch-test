FROM archlinux:latest

# Desactivar el sandbox de pacman para evitar errores de syscall con Rosetta en Mac
RUN echo "DisableSandbox" >> /etc/pacman.conf
# Sincronizar repositorios e instalar sudo
RUN pacman -Syu --noconfirm && pacman -S --noconfirm sudo

# Copiar el repositorio al container
COPY . /root/.dotfiles
WORKDIR /root/.dotfiles

# Asegurar permisos de ejecución
RUN chmod +x install.sh

# Ejecutar el script. 'yes s' alimenta la respuesta 's' para instalar dependencias.
CMD yes s | ./install.sh
