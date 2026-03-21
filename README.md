# ✨ Dotfiles de @dnqxxt ✨

¡Bienvenido/a a mi repositorio de dotfiles! 🚀 Aquí encontrarás las configuraciones que utilizo en mi día a día para que mi entorno de desarrollo sea lo más productivo, rápido y estético posible. 🎨💻

En este repositorio gestiono las configuraciones de mis herramientas favoritas: **Neovim** 📝, **Zsh** 🐚 y **Ghostty** 👻.

---

## 🛠️ Herramientas y Configuraciones

### 🐚 Zsh
Mi shell del día a día. Configurado para ser productivo y estar lleno de información útil. 💡
- **Perfiles:** Limpio, con auto-completado mejorado y gestión inteligente del historial.
- **Plugins:** `zsh-autosuggestions` y `zsh-syntax-highlighting` para una experiencia interactiva sin fricción (estilo Fish).
- **Herramientas Modernas:** `fzf` para búsqueda interactiva, `zoxide` (un `cd` más inteligente), `eza` (reemplazo de `ls` con íconos) y `bat` (un `cat` visual con sintaxis).

### 👻 Ghostty
Mi emulador de terminal preferido por su rapidez y simplicidad. ⚡
- **Tema:** 🎨 Monokai Classic
- **Tipografía:** 🔤 Tamaño 15
- **Estética:** ✨ Transparencia ligera (`0.96`) para ver el fondo sin perder el foco en el código, y altura de celdas ajustada (`10%`) para mayor legibilidad. En macOS, la barra de título es transparente para un look más limpio. 🍏

### 📝 Neovim
¡Mi editor de código principal impulsado por Lua! 🚀 Está configurado para ser un entorno de desarrollo completo.

**Núcleo de la Configuración:**
- 📦 **Gestor de Plugins:** [lazy.nvim](https://github.com/folke/lazy.nvim) (¡Habilita una carga rápida y asíncrona!)
- ⌨️ **Tecla Líder:** `<Space>` (Espacio). ¡El pulgar manda! 👍
- 🎨 **Tema:** [Tokyonight](https://github.com/folke/tokyonight.nvim) (Estilo `Night`, pero con colores de fondo y bordes oscuros/azulados personalizados para la máxima elegancia 🌌).

**Plugins Destacados:**
- 🔍 **Telescope:** Para encontrar archivos, buscar texto en todo el proyecto (grep) y más.
- 📂 **Nvim-Tree:** Un explorador de archivos lateral muy amigable y fácil de usar.
- 💡 **LSP & Mason:** Inteligencia de código integral. Autocompletado, diagnósticos y formato para Web (JS/TS, HTML, Tailwind), C/C++, Rust, Python, Haskell, Markdown (`marksman`), YAML, TOML (`taplo`) y Docker (`hadolint`). ¡Además incluye `ltex` para revisión ortográfica y gramatical avanzada en documentos!
- 🌳 **Treesitter:** Resaltado de sintaxis moderno, rápido y extremadamente preciso.
- 🌈 **Lualine:** Barra de estado hermosa y minimalista.
- 🐙 **Gitsigns & Lazygit:** Integración perfecta con Git. Ve los líneas modificadas al margen y abre la interfaz completa con un solo atajo.
- ⚡ **Flash:** Navega a cualquier palabra o línea del archivo a la velocidad de la luz.
- ✅ **Todo-Comments:** Resalta y localiza todos los `TODO`, `FIXME` y `HACK` en tu proyecto.
- ✨ **Conform:** Para formatear el código automáticamente y mantenerlo siempre impecable.
- 🚨 **Trouble:** ¡Encuentra y soluciona errores de diagnóstico en tu código en un panel lateral limpio!
- ⌨️ **Which-Key:** Si alguna vez olvidas un atajo de teclado, ¡este plugin te muestra una pequeña trampa al presionar la tecla líder!
- 🚗 **Nvim-Autopairs:** ¡Cierra llaves, paréntesis y comillas automáticamente como por arte de magia! 🪄
- 🏠 **Alpha:** Un dashboard de inicio bonito cuando abres Neovim sin archivos.
- 🖋️ **LaTeX (VimTeX, TexLab & LuaSnip):** Entorno premium para escribir documentos matemáticos, compilar al instante y sincronizar tu código con visores PDF como Skim.

---

## 🚀 Instalación Automatizada (Mac, Ubuntu, Arch)

He mejorado el script de instalación para que replicar mi configuración en **macOS, Ubuntu/Debian o Arch Linux** sea pan comido. 🍞 El script detecta tu sistema operativo y, si te faltan herramientas, ¡te ofrece instalarlas por ti de forma automática! 🤖

Este repositorio utiliza [Stow](https://www.gnu.org/software/stow/) para crear enlaces simbólicos (symlinks) de forma inteligente en tu directorio `~/.config` y `$HOME`. 🔗

### ⚙️ Instrucciones de Instalación

Clona o ubícate en esta carpeta y simplemente ejecuta el script:

```bash
git clone https://github.com/dnqxxt/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

El script se encargará automáticamente de:
1. 🕵️ Detectar si usas **macOS**, **Ubuntu/Debian** o **Arch Linux**.
2. 📦 Validar si tienes `stow`, `neovim`, `git` y `zsh` instalados. En caso contrario, te preguntará si deseas instalarlos usando tu gestor de paquetes favorito (`brew`, `apt` o `pacman`).
3. 🔗 Enlazar tus configuraciones de forma segura en los directorios correctos.

### 🛠️ Instalación manual de dependencias
Si prefieres instalar las herramientas de manera manual antes de correr el script, acá tienes los comandos para cada sistema:

**🍏 Para macOS:**
```bash
brew install stow neovim git zsh bat eza zoxide ripgrep fd fzf openjdk node lazygit gcc
```

**🐧 Para Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install -y stow neovim git zsh bat eza zoxide ripgrep fd-find fzf default-jre npm lazygit build-essential
```

**🦅 Para Arch Linux:**
```bash
sudo pacman -S stow neovim git zsh bat eza zoxide ripgrep fd fzf jre-openjdk npm lazygit gcc make
```

---
¡Y listo! 🎉 Tus configuraciones estarán listas para usarse. `lazy.nvim` se encargará de instalar todos tus plugins la próxima vez que abras `nvim`. 🎊

¡Espero que disfrutes de estas configuraciones tanto como yo! Si encuentras algo útil o tienes una sugerencia, siéntete libre de modificar a tu gusto. Happy hacking! 👨‍💻👩‍💻🔥
