#!/bin/bash

echo "🚀 ¡Bienvenido al instalador de Dotfiles para Ubuntu/Debian de @dnqxxt!"

# Configuración de robustez
set -e # Salir en caso de error
trap "echo '⚠️ El script falló. Revisa los mensajes anteriores.'; exit 1" ERR

# Asegurar que ~/.local/bin está en el PATH durante la ejecución
export PATH="$HOME/.local/bin:$PATH"

# Verificación de herramientas básicas antes de empezar
for tool in curl git tar; do
    if ! command -v $tool &>/dev/null; then
        echo "❌ Error: $tool no está instalado. Instálalo para continuar."
        exit 1
    fi
done

# Función para instalar dependencias
install_dependencies() {
    echo "📦 Instalando dependencias necesarias via apt..."
    sudo apt update
    sudo apt install -y software-properties-common wget gpg curl

    # Neovim PPA
    sudo add-apt-repository -y ppa:neovim-ppa/unstable || true

    # Eza repository
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg 2>/dev/null || true
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list

    sudo apt update
    sudo apt install -y git stow neovim zsh bat eza zoxide ripgrep fd-find fzf default-jre npm build-essential tmux unzip zip libffi-dev libgmp-dev libncurses-dev libtinfo-dev zlib1g-dev ffmpeg p7zip-full jq poppler-utils imagemagick python3-pip python3-venv pkg-config

    # Detectar arquitectura para binarios
    ARCH=$(uname -m)
    case "$ARCH" in
    x86_64)
        ARCH_LAZY="x86_64"
        ARCH_YAZI="x86_64-unknown-linux-gnu"
        ;;
    aarch64 | arm64)
        ARCH_LAZY="arm64"
        ARCH_YAZI="aarch64-unknown-linux-gnu"
        ;;
    *)
        echo "⚠️ Arquitectura $ARCH no soportada para instalación automática de binarios."
        exit 1
        ;;
    esac

    # GHCup
    if ! command -v ghcup &>/dev/null; then
        echo "📦 Instalando GHCup (Haskell toolchain)..."
        curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 bash
    fi

    # Rust (Cargo)
    if ! command -v cargo &> /dev/null; then
        echo "📦 Instalando Rust y Cargo via rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        # Cargar entorno de cargo para la sesión actual del script
        source "$HOME/.cargo/env"
    fi
    
    # Lazygit
    echo "📦 Instalando Lazygit ($ARCH_LAZY)..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_${ARCH_LAZY}.tar.gz"
    tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
    sudo install /tmp/lazygit /usr/local/bin/lazygit

    # Yazi
    echo "📦 Instalando Yazi ($ARCH_YAZI)..."
    YAZI_ZIP="/tmp/yazi_${ARCH_YAZI}.zip"
    curl -Lo "$YAZI_ZIP" "https://github.com/sxyazi/yazi/releases/latest/download/yazi-${ARCH_YAZI}.zip"
    unzip -qo "$YAZI_ZIP" -d /tmp
    if [ -d "/tmp/yazi-${ARCH_YAZI}" ]; then
        sudo install "/tmp/yazi-${ARCH_YAZI}/yazi" /usr/local/bin/yazi
        sudo install "/tmp/yazi-${ARCH_YAZI}/ya" /usr/local/bin/ya
        rm -rf "/tmp/yazi-${ARCH_YAZI}" "$YAZI_ZIP"
    else
        echo "❌ Error: No se pudo encontrar el directorio extraído de Yazi."
        exit 1
    fi

    # Symlinks para bat y fd
    mkdir -p "$HOME/.local/bin"
    [ -f /usr/bin/batcat ] && [ ! -f "$HOME/.local/bin/bat" ] && ln -s /usr/bin/batcat "$HOME/.local/bin/bat"
    [ -f /usr/bin/fdfind ] && [ ! -f "$HOME/.local/bin/fd" ] && ln -s /usr/bin/fdfind "$HOME/.local/bin/fd"
    export PATH="$HOME/.local/bin:$PATH"
}

# Verificar dependencias
echo "🔍 Verificando dependencias..."
# Asegurar que el path de cargo esté presente por si acaso se acaba de instalar
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

MISSING_PKGS=0
for cmd in git stow nvim zsh rg fzf bat eza zoxide tmux yazi lazygit unzip cargo; do
    CHECK_CMD=$cmd
    if [ "$cmd" = "bat" ]; then CHECK_CMD="batcat"; fi
    if [ "$cmd" = "fd" ]; then CHECK_CMD="fdfind"; fi

    if ! command -v $CHECK_CMD &>/dev/null && ! command -v $cmd &>/dev/null; then
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
    curl -Lo /tmp/k9s.tar.gz "https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz" && sudo tar -xzf /tmp/k9s.tar.gz -C /usr/local/bin k9s
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
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
