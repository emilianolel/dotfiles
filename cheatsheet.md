# 📝 Neovim Cheatsheet

Este documento recopila todos los atajos de teclado configurados en tu entorno de Neovim. 

> **Tecla Líder (`<leader>`)**: `Espacio`
> **Tecla Local Líder (`<localleader>`)**: `Espacio` (Mapeada igual para unificar los comandos de LaTeX)

## 📌 Atajos Generales
| Atajo | Acción | Modo |
|---|---|---|
| `jk` | Salir del modo insertar (volver a modo normal) | Insertar |
| `<leader>nh` | Limpiar el resaltado de búsqueda | Normal |
| `<leader>+` | Incrementar número bajo el cursor | Normal |
| `<leader>-` | Decrementar número bajo el cursor | Normal |

## 🪟 Gestión de Ventanas (Splits)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>sv` | Dividir la ventana verticalmente | Normal |
| `<leader>sh` | Dividir la ventana horizontalmente | Normal |
| `<leader>se` | Igualar el tamaño de todas las divisiones | Normal |
| `<leader>sx` | Cerrar la división actual | Normal |

## 📑 Gestión de Pestañas (Tabs)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>to` | Abrir una nueva pestaña | Normal |
| `<leader>tx` | Cerrar la pestaña actual | Normal |
| `<leader>tn` | Ir a la pestaña siguiente | Normal |
| `<leader>tp` | Ir a la pestaña anterior | Normal |
| `<leader>tf` | Abrir el buffer actual en una nueva pestaña | Normal |

---

## 🛠️ Plugins Destacados

### 📁 Nvim-Tree (Explorador de Archivos)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>ee` | Abrir / Cerrar el explorador de archivos | Normal |
| `<leader>ef` | Abrir explorador enfocado en el archivo actual | Normal |
| `<leader>ec` | Colapsar las carpetas del explorador | Normal |
| `<leader>er` | Recargar el explorador de archivos | Normal |

### 🔍 Telescope (Búsqueda Fuzzy)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>ff` | Buscar archivos en el proyecto actual | Normal |
| `<leader>fr` | Buscar en los archivos recientes | Normal |
| `<leader>fs` | Buscar un texto/string en todo el proyecto (*Live Grep*) | Normal |
| `<leader>fc` | Buscar el texto bajo el cursor en todo el proyecto | Normal |
| `<leader>ft` | Buscar comentarios `TODO` en el proyecto | Normal |
| `<leader>fk` | Ver la lista y buscar todos los atajos de teclado (Keymaps) | Normal |

### 🚨 Trouble (Diagnósticos y Errores LSP)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>xw` | Ver diagnósticos de todo el espacio de trabajo (Workspace) | Normal |
| `<leader>xd` | Ver diagnósticos del documento actual | Normal |
| `<leader>xq` | Abrir la lista Quickfix | Normal |
| `<leader>xl` | Abrir la Location List | Normal |
| `<leader>xt` | Abrir la lista de comentarios `TODO` en Trouble | Normal |

### 🧱 Mason & Código LSP
| Comando / Atajo | Acción | Modo |
|---|---|---|
| `:Mason` | Abrir la interfaz para gestionar LSPs, Linters y Formatters | Comandos |
| `:LspInfo` | Ver el estado de los servidores activos en tu archivo actual | Comandos |
| `K` | Mostrar documentación al posar el cursor sobre una función/variable | Normal |
| `gd` | Ir a la definición de la función / componente | Normal |

### ⚡ Flash (Navegación Ultrarrápida)
| Atajo | Acción | Modo |
|---|---|---|
| `s` | Saltar a cualquier palabra o carácter visible en pantalla | Normal / Visual |
| `S` | Selección semántica envolvente (Treesitter) usando Flash | Normal / Visual |
| `r` | Remote Flash (ejecutar acción en otro rango y regresar) | Operator-pending |
| `R` | Búsqueda por rango de Treesitter usando Flash | Op-pending / Visual |

### 🐙 Git (Gitsigns & Lazygit)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>gg` | Abrir **Lazygit** en un panel flotante | Normal |
| `]h` | Ir al siguiente cambio de Git (Next Hunk) | Normal |
| `[h` | Ir al cambio anterior de Git (Prev Hunk) | Normal |
| `<leader>hs` | Preparar cambio (Stage Hunk) | Normal |
| `<leader>hr` | Revertir cambio local (Reset Hunk) | Normal |
| `<leader>hp` | Previsualizar diferencias del cambio actual | Normal |
| `<leader>hb` | Ver quién editó la línea (*Blame*) | Normal |
| `<leader>hd` | Ver diferencias completas (*Diff this*) | Normal |

### ✅ Todo-Comments
| Atajo | Acción | Modo |
|---|---|---|
| `]t` | Saltar al siguiente comentario `TODO` / `FIXME` / `HACK` | Normal |
| `[t` | Saltar al comentario anterior | Normal |

### 🖋️ VimTeX (LaTeX)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>ll` | Iniciar / Detener compilación automática continua | Normal |
| `<leader>lv` | Ver documento (Forward Search hacia Skim) | Normal |
| `<leader>li` | Ver información del estado del compilador y proyecto | Normal |
| `<leader>le` | Ver errores y advertencias de la última compilación | Normal |

*Nota: Skim soporta Backward Search haciendo `Cmd + Shift + Clic` en el PDF para regresar directamente a la línea correspondiente en Neovim.*

---

## ⌨️ CLI / Terminal (Zsh & Herramientas)
| Herramienta | Atajo / Comando | Acción | Modo |
|---|---|---|---|
| **FZF** | `Ctrl + R` | Buscar en el historial de comandos de manera interactiva | Terminal |
| **FZF** | `Ctrl + T` | Buscar archivos en la carpeta actual y pegarlo en la terminal | Terminal |
| **FZF** | `Alt + C` | Cambiar a un subdirectorio de forma interactiva | Terminal |
| **Zoxide** | `cd <ruta>` | Navega directorios inteligentemente (reemplaza el `cd` nativo) | Terminal |
| **Eza** | `ls` / `ll` | (Alias automáticos) Listar archivos con íconos hermosos y colores | Terminal |
| **Bat** | `cat <file>` | (Alias automático) Leer texto en consola con sintaxis colorizada | Terminal |
| **OMZ** | `als` | Listar todos los aliases activos definidos en el entorno | Terminal |
| **OMZ** | `copypath` | Copiar el path del directorio actual al clipboard | Terminal |
| **OMZ** | `copyfile <file>` | Copiar el contenido de un archivo al clipboard | Terminal |
| **Python Venv** | `vmk` | Crear un entorno virtual `.venv` en la carpeta actual y activarlo | Terminal |
| **Python Venv** | `va` | Activar el entorno virtual `.venv` o `venv` de la carpeta actual | Terminal |
| **Python Venv** | `vd` | Desactivar el entorno virtual activo | Terminal |

---

## 🦅 Yazi (Terminal File Manager)

### Navegación
| Atajo | Acción | Modo |
|---|---|---|
| `k` / `j` | Subir / Bajar en la lista de archivos | Normal |
| `h` / `l` | Regresar al padre / Entrar al directorio o abrir | Normal |
| `g g` | Ir al principio del directorio | Normal |
| `G` | Ir al final del directorio | Normal |
| `H` / `L` | Historial: Atrás / Adelante | Normal |
| `Ctrl + u` / `Ctrl + d` | Subir / Bajar media página | Normal |

### Operaciones de Archivo
| Atajo | Acción | Modo |
|---|---|---|
| `<Space>` | Alternar selección del archivo actual | Normal |
| `v` | Entrar en modo visual (selección múltiple) | Normal |
| `o` / `Enter` | Abrir archivos seleccionados | Normal |
| `y` | Copiar (Yank) | Normal |
| `x` | Cortar (Yank --cut) | Normal |
| `p` | Pegar archivos | Normal |
| `P` | Pegar y sobrescribir si existen | Normal |
| `d` | Enviar a la papelera | Normal |
| `D` | Eliminar permanentemente | Normal |
| `a` | Crear nuevo archivo o carpeta (terminar con `/` para carpeta) | Normal |
| `r` | Renombrar archivo | Normal |
| `.` | Alternar visibilidad de archivos ocultos | Normal |
| `f` | Filtrar archivos en vivo | Normal |
| `c c` | Copiar la ruta completa (path) | Normal |

### Búsqueda y Saltos
| Atajo | Acción | Modo |
|---|---|---|
| `s` | Buscar archivos por nombre vía `fd` | Normal |
| `S` | Buscar contenido en archivos vía `ripgrep` | Normal |
| `z` | Saltar a un archivo/carpeta vía `fzf` | Normal |
| `Z` | Saltar a un directorio frecuente vía `zoxide` | Normal |
| `/` | Buscar siguiente (estilo Vim) | Normal |
| `?` | Buscar anterior (estilo Vim) | Normal |
| `n` / `N` | Siguiente / Anterior resultado de búsqueda | Normal |

---

## 🪟 Tmux (Gestión de Terminales)
> **Prefijo**: `Ctrl + Space` (mapeado desde el default `Ctrl + B`)

### Sesiones
| Atajo | Acción | Modo |
|---|---|---|
| `Prefijo` + `d` | Desconectarse (sesión queda guardada en segundo plano) | Tmux |
| `Prefijo` + `$` | Renombrar la sesión actual | Tmux |
| `Prefijo` + `s` | Listar y cambiar sesiones interactivamente | Tmux |
| `tmux new -s <nombre>` | Crear una nueva sesión con nombre | Terminal |
| `tmux attach -t <nombre>` | Reconectarse a una sesión existente | Terminal |
| `tmux ls` | Listar todas las sesiones activas | Terminal |
| `tmux kill-server` | Matar todas las sesiones y el servidor Tmux | Terminal |

### Ventanas (Pestañas)
| Atajo | Acción | Modo |
|---|---|---|
| `Prefijo` + `c` | Crear una nueva ventana | Tmux |
| `Prefijo` + `&` | Cerrar la ventana actual | Tmux |
| `Prefijo` + `,` | Renombrar la ventana actual | Tmux |
| `Prefijo` + `[0-9]` | Cambiar a la ventana número N | Tmux |
| `Prefijo` + `n` | Ir a la siguiente ventana | Tmux |
| `Prefijo` + `p` | Ir a la ventana anterior | Tmux |
| `Prefijo` + `w` | Listar y cambiar ventanas interactivamente | Tmux |

### Paneles (Splits)
| Atajo | Acción | Modo |
|---|---|---|
| `Prefijo` + `%` | Dividir el panel verticalmente (dos paneles lado a lado) | Tmux |
| `Prefijo` + `"` | Dividir el panel horizontalmente (dos paneles arriba/abajo) | Tmux |
| `Prefijo` + `x` | Cerrar el panel actual | Tmux |
| `Prefijo` + `z` | Alternar zoom (pantalla completa del panel actual) | Tmux |
| `Prefijo` + `↑ ↓ ← →` | Navegar entre paneles con las flechas | Tmux |
| `Prefijo` + `{` | Mover el panel hacia la izquierda | Tmux |
| `Prefijo` + `}` | Mover el panel hacia la derecha | Tmux |
| `Prefijo` + `q` | Ver números de panel (pulsa el número para saltar) | Tmux |

### Copiar y Scroll
| Atajo | Acción | Modo |
|---|---|---|
| `Prefijo` + `[` | Entrar al modo de copia/scroll (con el mouse o teclado) | Tmux |
| `q` | Salir del modo de copia/scroll | Copia |

---

## ☁️ GCP Data Engineering

### 🗄️ vim-dadbod (Cliente SQL)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>db` | Abrir / Cerrar el explorador de bases de datos | Normal |
| `Enter` | Ejecutar la query seleccionada o bajo el cursor | Normal |

### 🐞 nvim-dap (Debugger Python)
| Atajo | Acción | Modo |
|---|---|---|
| `<leader>dc` | Iniciar / Continuar la ejecución del debugger | Normal |
| `<leader>db` | Poner / Quitar un breakpoint en la línea actual | Normal |
| `<leader>dB` | Poner un breakpoint condicional | Normal |
| `<leader>do` | Step Over (ejecutar línea sin entrar a función) | Normal |
| `<leader>di` | Step Into (entrar a la función) | Normal |
| `<leader>dO` | Step Out (salir de la función actual) | Normal |
| `<leader>dr` | Abrir REPL interactivo del debugger | Normal |
| `<leader>dt` | Terminar la sesión de debug | Normal |
| `<leader>du` | Abrir / Cerrar el panel UI del debugger | Normal |

### ⎈ k9s (Kubernetes / GKE)
| Atajo | Acción | Modo |
|---|---|---|
| `k9s` | Abrir la interfaz interactiva de Kubernetes | Terminal |
| `:pod` | Ver todos los pods del namespace actual | k9s |
| `:ns` | Cambiar de namespace | k9s |
| `l` | Ver logs del pod seleccionado | k9s |
| `d` | Describir el recurso seleccionado | k9s |
| `Ctrl + d` | Eliminar el recurso seleccionado | k9s |
| `/` | Filtrar recursos por nombre | k9s |

### 🧠 atuin (Historial Inteligente)
| Atajo | Acción | Modo |
|---|---|---|
| `Ctrl + R` | Buscar en historial con interfaz interactiva (reemplaza fzf) | Terminal |
| `Ctrl + ↑` | Navegar hacia el anterior en el historial | Terminal |
