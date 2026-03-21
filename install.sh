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
        brew install git stow neovim zsh bat eza zoxide ripgrep fd fzf openjdk node lazygit gcc tmux
    elif [ "$DISTRO" = "Arch" ]; then
        sudo pacman -Syu --noconfirm git stow neovim zsh bat eza zoxide ripgrep fd fzf jre-openjdk npm lazygit gcc make tmux
    elif [ "$DISTRO" = "Debian/Ubuntu" ]; then
        sudo apt update
        sudo apt install -y git stow neovim zsh bat eza zoxide ripgrep fd-find fzf default-jre npm lazygit build-essential tmux
    else
        echo "⚠️ Sistema no soportado para instalación automática."
        echo "Por favor, instala manualmente: git, stow, neovim, zsh."
        exit 1
    fi
}

# Verificar dependencias
MISSING_PKGS=0
for cmd in git stow nvim zsh rg fzf bat eza zoxide tmux; do
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

if [ "$DISTRO" = "macOS" ]; then
    read -p "📝 ¿Deseas instalar el entorno opcional de LaTeX (MacTeX y Skim)? (s/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        echo "📦 Instalando MacTeX y Skim..."
        brew install --cask mactex-no-gui skim
        echo "✅ Entorno de LaTeX instalado. (Deberás reiniciar tu terminal al finalizar el script para cargar los nuevos comandos de TeX)."
    fi
fi

read -p "☁️ ¿Deseas instalar el stack de Data Engineering / GCP (k9s, atuin, gitmux, rust)? (s/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo "📦 Instalando herramientas de Data Engineering y GCP..."
    if [ "$DISTRO" = "macOS" ]; then
        brew install k9s gitmux atuin rust
    elif [ "$DISTRO" = "Arch" ]; then
        sudo pacman -Syu --noconfirm k9s gitmux atuin rust
    elif [ "$DISTRO" = "Debian/Ubuntu" ]; then
        curl -Lo /tmp/k9s.tar.gz "https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz" && tar -xzf /tmp/k9s.tar.gz -C /usr/local/bin k9s
        curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    fi
    echo "✅ Stack de Data Engineering instalado. Abre Neovim y usa :MasonInstall jinja-lsp protols dockerls para instalar los LSPs correspondientes."
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

echo "💻 Enlazando configuración de Tmux..."
stow -v -t "$HOME" tmux

echo "📦 Instalando plugins de Zsh (zsh-autosuggestions, zsh-syntax-highlighting)..."
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

echo "📦 Instalando TPM (Tmux Plugin Manager)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "🎉 ¡Configuración completada con éxito!"
echo "Abre 'nvim' para que lazy.nvim comience a descargar los plugins. ¡Happy Hacking! ✨"
