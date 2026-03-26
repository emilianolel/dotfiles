#!/bin/bash

echo "🚀 ¡Bienvenido al instalador de Dotfiles para Arch Linux de @dnqxxt!"

# Configuración de robustez
set -e # Salir en caso de error
trap "echo '⚠️ El script falló. Revisa los mensajes anteriores.'; exit 1" ERR

# Asegurar que ~/.local/bin está en el PATH durante la ejecución
export PATH="$HOME/.local/bin:$PATH"

# Verificación de herramientas básicas antes de empezar
for tool in curl git unzip tar; do
    if ! command -v $tool &> /dev/null; then
        echo "❌ Error: $tool no está instalado. Instálalo para continuar."
        exit 1
    fi
done

# Función para instalar dependencias
install_dependencies() {
    echo "📦 Instalando dependencias necesarias via pacman..."
    sudo pacman -Syu --noconfirm git stow neovim zsh bat eza zoxide ripgrep fd fzf jre-openjdk npm lazygit gcc make tmux unzip zip rust
}

# Verificar dependencias
echo "🔍 Verificando dependencias..."
MISSING_PKGS=0
for cmd in git stow nvim zsh rg fzf bat eza zoxide tmux yazi lazygit unzip cargo; do
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
    echo "✅ Todas las dependencias están instaladas."
fi

# Instalación opcional de Data Engineering stack
read -p "☁️ ¿Deseas instalar el stack de Data Engineering / GCP (k9s, atuin, gitmux)? (s/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo "📦 Instalando herramientas de Data Engineering y GCP..."
    sudo pacman -Syu --noconfirm k9s gitmux atuin
    echo "✅ Stack de Data Engineering instalado. Abre Neovim y usa :MasonInstall jinja-lsp protols dockerls para instalar los LSPs correspondientes."
fi

# == Configuración de Zsh y Oh My Zsh ==
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Instalando Oh My Zsh (modo desatendido)..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Cambiar el shell predeterminado a zsh
ZSH_PATH=$(which zsh)
if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo "🐚 Cambiando el shell predeterminado a Zsh..."
    sudo chsh -s "$ZSH_PATH" "$USER"
fi

# Crear directorios
mkdir -p "$HOME/.config"

# Función para manejar conflictos de stow
handle_stow_conflicts() {
    local target=$1
    if [ -f "$HOME/$target" ] && [ ! -L "$HOME/$target" ]; then
        echo "⚠️  Detectado $target existente (no es un symlink). Moviéndolo a $target.bak..."
        mv "$HOME/$target" "$HOME/$target.bak"
    elif [ -d "$HOME/$target" ] && [ ! -L "$HOME/$target" ] && [ "$target" != ".config" ]; then
        echo "⚠️  Detectado directorio $target existente. Moviéndolo a $target.bak..."
        mv "$HOME/$target" "$HOME/$target.bak"
    fi
}

# Stow
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR" || exit

echo "💚 Preparando el entorno para Stow..."
handle_stow_conflicts ".zshrc"
handle_stow_conflicts ".zprofile"
handle_stow_conflicts ".tmux.conf"
handle_stow_conflicts ".config/nvim"
handle_stow_conflicts ".config/yazi"
handle_stow_conflicts ".config/ghostty"

echo "👻 Enlazando configuración de Ghostty..."
stow -v -t "$HOME" ghostty

echo "💚 Enlazando configuración de Zsh..."
stow -v -t "$HOME" zsh

echo "📝 Enlazando configuración de Neovim..."
stow -v -t "$HOME" nvim

echo "💻 Enlazando configuración de Tmux..."
stow -v -t "$HOME" tmux

echo "🦅 Enlazando configuración de Yazi..."
stow -v -t "$HOME" yazi

# Plugins de Zsh
echo "📦 Instalando plugins de Zsh..."
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

# TPM
echo "📦 Instalando TPM (Tmux Plugin Manager)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "🎉 ¡Configuración completada con éxito!"
echo "Abre 'nvim' para que lazy.nvim comience a descargar los plugins. ¡Happy Hacking! ✨"
