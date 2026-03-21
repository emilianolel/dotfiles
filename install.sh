#!/bin/bash

echo "🚀 ¡Bienvenido al instalador automático de Dotfiles de @dnqxxt!"

# Detectar el sistema operativo
OS="$(uname -s)"
case "$OS" in
    Linux*)
        if [ -f /etc/arch-release ]; then
            DISTRO="Arch"
        elif [ -f /etc/debian_version ] || [ -f /etc/lsb-release ]; then
            DISTRO="Debian/Ubuntu"
        else
            DISTRO="Unknown"
        fi
        ;;
    Darwin*)
        DISTRO="macOS"
        ;;
    *)
        DISTRO="Unknown"
        ;;
esac

echo "💻 Sistema detectado: $DISTRO"

# Función para instalar dependencias según el SO
install_dependencies() {
    echo "📦 Instalando dependencias necesarias (git, stow, neovim, zsh)..."
    if [ "$DISTRO" = "macOS" ]; then
        if ! command -v brew &> /dev/null; then
            echo "❌ Homebrew no está instalado. Instálalo primero: https://brew.sh/"
            exit 1
        fi
        brew update
        brew install git stow neovim zsh
    elif [ "$DISTRO" = "Arch" ]; then
        sudo pacman -Syu --noconfirm git stow neovim zsh
    elif [ "$DISTRO" = "Debian/Ubuntu" ]; then
        sudo apt update
        sudo apt install -y git stow neovim zsh
    else
        echo "⚠️ Sistema no soportado para instalación automática."
        echo "Por favor, instala manualmente: git, stow, neovim, zsh."
        exit 1
    fi
}

# Verificar dependencias
MISSING_PKGS=0
for cmd in git stow nvim zsh; do
    if ! command -v $cmd &> /dev/null; then
        echo "❌ Faltando: $cmd"
        MISSING_PKGS=1
    fi
done

if [ $MISSING_PKGS -eq 1 ]; then
    read -p "🤔 ¿Deseas instalar las dependencias faltantes automáticamente? (s/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        install_dependencies
    else
        echo "👋 Por favor, instala las dependencias e inténtalo de nuevo."
        exit 1
    fi
else
    echo "✅ Todas las dependencias están instaladas. Procediendo a enlazar configuraciones..."
fi

# Crear directorios si no existen
mkdir -p "$HOME/.config"

# Usar stow para enlazar las configuraciones
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$DOTFILES_DIR" || exit

echo "👻 Enlazando configuración de Ghostty..."
stow -v -t "$HOME" ghostty

echo "🐚 Enlazando configuración de Zsh..."
stow -v -t "$HOME" zsh

echo "📝 Enlazando configuración de Neovim..."
stow -v -t "$HOME" nvim

echo "🎉 ¡Configuración completada con éxito!"
echo "Abre 'nvim' para que lazy.nvim comience a descargar los plugins. ¡Happy Hacking! ✨"
