#!/bin/bash

echo "🚀 ¡Bienvenido al instalador de Dotfiles!"
echo "Verificando dependencias..."

# Verificar si stow está instalado
if ! command -v stow &> /dev/null; then
    echo "❌ Error: GNU Stow no está instalado."
    echo "🍏 En macOS: brew install stow"
    echo "🐧 En Linux: sudo apt install stow (o equivalente en tu distro)"
    exit 1
fi

echo "✅ Stow está instalado. Procediendo a enlazar configuraciones..."

# Crear directorios si no existen
mkdir -p "$HOME/.config"

# Usar stow para enlazar las configuraciones
# Asumimos que el script corre desde ~/.dotfiles
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
