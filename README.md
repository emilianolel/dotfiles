# ✨ Dotfiles de @dnqxxt ✨

¡Bienvenido/a a mi repositorio de dotfiles! 🚀 Aquí encontrarás las configuraciones que utilizo en mi día a día para que mi entorno de desarrollo sea lo más productivo, rápido y estético posible. 🎨💻

En este repositorio gestiono las configuraciones de mis herramientas favoritas: **Neovim** 📝 y **Ghostty** 👻.

---

## 🛠️ Herramientas y Configuraciones

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
- 🔍 **Telescope:** Para encontrar archivos, buscar texto en todo el proyecto (grep) y más, todo de forma difusa y rapidísima.
- 📂 **Nvim-Tree:** Un explorador de archivos lateral muy amigable y fácil de usar.
- 💡 **LSP & Mason:** Inteligencia de código (autocompletado, ir a definición, referencias) configurado con `mason.nvim` para instalar servidores fácilmente.
- ✨ **Conform:** Para formatear el código automáticamente y mantenerlo siempre impecable.
- 🚨 **Trouble:** ¡Encuentra y soluciona errores de diagnóstico en tu código en un panel lateral limpio!
- ⌨️ **Which-Key:** Si alguna vez olvidas un atajo de teclado, ¡este plugin te muestra una pequeña trampa al presionar la tecla líder!
- 🚗 **Nvim-Autopairs:** ¡Cierra llaves, paréntesis y comillas automáticamente como por arte de magia! 🪄
- 🏠 **Alpha:** Un dashboard de inicio bonito cuando abres Neovim sin archivos.

---

## 🚀 Instalación

He preparado un script súper sencillo para que instalar estas configuraciones sea pan comido. 🍞 Este repositorio utiliza [Stow](https://www.gnu.org/software/stow/) para crear enlaces simbólicos (symlinks) de forma inteligente en tu directorio `~/.config`. 🔗

### 🍏 Para macOS
Asegúrate de tener instaladas las dependencias base (como `git`, `neovim`, `stow`):
```bash
# ¡Usa Homebrew! 🍺
brew install stow neovim git
```

### 🐧 Para Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install stow neovim git
```

### ⚙️ Usando el Instalador Automático
Una vez que tengas `stow` instalado, clona o ubícate en esta carpeta y ejecuta:

```bash
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

¡Y listo! 🎉 Tus configuraciones estarán enlazadas en tu sistema y `lazy.nvim` se encargará de instalar todos los plugins la próxima vez que abras `nvim`. 🎊

---
¡Espero que disfrutes de estas configuraciones tanto como yo! Si encuentras algo útil o tienes una sugerencia, siéntete libre de modificar a tu gusto. Happy hacking! 👨‍💻👩‍💻🔥
