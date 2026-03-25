# ✨ Dotfiles de @dnqxxt ✨

¡Bienvenido/a a mi repositorio de dotfiles! 🚀 Aquí encontrarás las configuraciones que utilizo en mi día a día para que mi entorno de desarrollo sea lo más productivo, rápido y estético posible. 🎨💻

En este repositorio gestiono las configuraciones de mis herramientas favoritas: **Neovim** 📝, **Zsh** 🐚, **Ghostty** 👻 y **Yazi** 🦅.

---

## 🛠️ Herramientas y Configuraciones

### 💚 Zsh
Mi shell del día a día. Configurado para ser extremadamente productivo. 💡
- **Plugins de Autocompletado:** `zsh-autosuggestions` y `zsh-syntax-highlighting` para una experiencia interactiva sin fricción (estilo Fish Shell). 🐟
- **Plugins de OMZ:** `aliases` (`als` para listar todos tus aliases), `copypath` y `copyfile` (al clipboard desde la terminal), `jsontools` (formateo de JSON), `python` (shortcuts de entornos virtuales).
- **Historial Inteligente:** 📜 50,000 entradas, sin duplicados, compartido entre sesiones de Tmux y con verificación antes de ejecutar `!!`.
- **Corrección de Typos:** `setopt CORRECT` — Zsh sugiere la corrección automáticamente si escribes mal un comando.
- **Completado Mejorado:** Case-insensitive y con colores (`cd desk` → `Desktop` automático).
- **Herramientas Modernas:** `fzf` + `atuin` para búsqueda de historial, `zoxide` reemplaza el `cd` nativo con memoria inteligente, `eza` reemplaza `ls` con íconos y `bat` reemplaza `cat` con sintaxis.
- **Python Venv:** Aliases `vmk` (crear + activar), `va` (activar), `vd` (desactivar) para gestión rápida de entornos virtuales.

### 👻 Ghostty
Mi emulador de terminal preferido por su rapidez y simplicidad. ⚡
- **Tema:** 🎨 Monokai Classic
- **Tipografía:** 🔤 Tamaño 15
- **Estética:** ✨ Transparencia ligera (`0.96`) para ver el fondo sin perder el foco en el código, y altura de celdas ajustada (`10%`) para mayor legibilidad. En macOS, la barra de título es transparente para un look más limpio. 🍏

### 🦅 Yazi
Un gestor de archivos para la terminal extremadamente rápido, escrito en Rust. ⚡
- **Vista Previa:** 🖼️ Soporte para imágenes, videos, PDF y resaltado de sintaxis en código.
- **Navegación:** ⌨️ Atajos estilo Vim (`h`, `j`, `k`, `l`) para una navegación fluida.
- **Herramientas:** Integración con `fzf` para saltos rápidos y `zoxide` para navegar por directorios frecuentes.

### 🪟 Tmux
Multiplexador de terminal configurado para integrarse perfectamente con Ghostty y Neovim. 🔄
- **Arranque Automático:** Se lanza de forma nativa desde Ghostty para mantener todas tus sesiones guardadas.
- **Soporte:** Scroll interactivo (mouse) habilitado, `tmux-256color` + TrueColor (RGB) para preservar exactamente el mismo aspecto de Neovim y el prompt Pure.

### ☁️ Stack de Data Engineering (GCP)
Herramientas especializadas para flujos de trabajo de Data Engineering, diseñadas para el stack de Google Cloud Platform.

**Neovim Plugins:**
- 🗄️ **vim-dadbod & UI:** Cliente SQL interactivo embebido en Neovim. Conectáte a **BigQuery, PostgreSQL, Cloud SQL** y ejecuta queries con autocompletado de tablas y columnas.
- 🐞 **nvim-dap & Python:** Debugger visual completo con breakpoints, step-into/over, REPL y panel de variables. Especialmente pensado para Python en **Dataflow, Cloud Functions y Composer**.
- 🕹️ **Jinja LSP, Docker LSP, Protols:** Soporte de inteligencia de código para templates Jinja2 (dbt, Airflow), Dockerfiles y archivos Protobuf (Pub/Sub, gRPC).

**Herramientas CLI:**
- ⎈️ **k9s:** TUI interactiva para Kubernetes (**GKE**). Visualiza, gestiona y depura pods en tiempo real.
- 🚚 **gitmux:** Muestra el estado del repositorio Git (branch, cambios) directamente en la barra de Tmux.
- 🧠 **atuin:** Historial de comandos inteligente y sincronizado, reemplaza `fzf+Ctrl+R` con búsqueda instantánea.

### 📝 Neovim
¡Mi editor de código principal impulsado por Lua! 🚀 Está configurado para ser un entorno de desarrollo completo.

**Núcleo de la Configuración:**
- 📦 **Gestor de Plugins:** [lazy.nvim](https://github.com/folke/lazy.nvim) (¡Habilita una carga rápida y asíncrona!)
- ⌨️ **Tecla Líder:** `<Space>` (Espacio). ¡El pulgar manda! 👍
- 🎨 **Tema:** [Tokyonight](https://github.com/folke/tokyonight.nvim) (Estilo `Night`, pero con colores de fondo y bordes oscuros/azulados personalizados para la máxima elegancia 🌌).

**Plugins Destacados:**
- 🔍 **Telescope:** Para encontrar archivos, buscar texto en todo el proyecto (grep) y más.
- 📂 **Yazi (Yazi.nvim):** Un explorador de archivos extremadamente potente y rápido que se abre en una ventana flotante. Reemplaza al tradicional explorador lateral para darte todas las funcionalidades de Yazi directamente dentro de Neovim. ✨
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
brew install stow neovim git zsh bat eza zoxide ripgrep fd fzf openjdk node lazygit gcc tmux yazi ffmpeg-full sevenzip jq poppler resvg imagemagick-full font-symbols-only-nerd-font chafa k9s gitmux atuin rust
```

**🐧 Para Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install -y stow neovim git zsh bat eza zoxide ripgrep fd-find fzf default-jre npm lazygit build-essential tmux unzip zip libffi-dev libgmp-dev libncurses-dev libtinfo-dev zlib1g-dev chafa
```

**🦅 Para Arch Linux:**
```bash
sudo pacman -S stow neovim git zsh bat eza zoxide ripgrep fd fzf jre-openjdk npm lazygit gcc make tmux chafa
```

---
¡Y listo! 🎉 Tus configuraciones estarán listas para usarse. `lazy.nvim` se encargará de instalar todos tus plugins la próxima vez que abras `nvim`. 🎊

¡Espero que disfrutes de estas configuraciones tanto como yo! Si encuentras algo útil o tienes una sugerencia, siéntete libre de modificar a tu gusto. Happy hacking! 👨‍💻👩‍💻🔥
