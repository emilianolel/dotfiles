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
| **Zoxide** | `z <ruta>` | Cambiar a un directorio frecuentemente usado (alternativa de `cd`) | Terminal |
| **Eza** | `ls` / `ll` | (Alias automáticos) Listar archivos con íconos hermosos y colores | Terminal |
| **Bat** | `cat <file>` | (Alias automático) Leer texto en consola con sintaxis colorizada | Terminal |
