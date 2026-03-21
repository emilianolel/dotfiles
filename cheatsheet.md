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
| Atajo | Acción |
|---|---|
| `<leader>ee` | Abrir / Cerrar el explorador de archivos |
| `<leader>ef` | Abrir explorador enfocado en el archivo actual |
| `<leader>ec` | Colapsar las carpetas del explorador |
| `<leader>er` | Recargar el explorador de archivos |

### 🔍 Telescope (Búsqueda Fuzzy)
| Atajo | Acción |
|---|---|
| `<leader>ff` | Buscar archivos en el proyecto actual |
| `<leader>fr` | Buscar en los archivos recientes |
| `<leader>fs` | Buscar un texto/string en todo el proyecto (*Live Grep*) |
| `<leader>fc` | Buscar el texto bajo el cursor en todo el proyecto |
| `<leader>ft` | Buscar comentarios `TODO` en el proyecto |
| `<leader>fk` | Ver la lista y buscar todos los atajos de teclado (Keymaps) |

### 🚨 Trouble (Diagnósticos y Errores LSP)
| Atajo | Acción |
|---|---|
| `<leader>xw` | Ver diagnósticos de todo el espacio de trabajo (Workspace) |
| `<leader>xd` | Ver diagnósticos del documento actual |
| `<leader>xq` | Abrir la lista Quickfix |
| `<leader>xl` | Abrir la Location List |
| `<leader>xt` | Abrir la lista de comentarios `TODO` en Trouble |

### 🖋️ VimTeX (LaTeX)
| Atajo | Acción |
|---|---|
| `<leader>ll` | Iniciar / Detener compilación automática continua |
| `<leader>lv` | Ver documento (Forward Search hacia Skim) |
| `<leader>li` | Ver información del estado del compilador y proyecto |
| `<leader>le` | Ver errores y advertencias de la última compilación |

*Nota: Skim soporta Backward Search haciendo `Cmd + Shift + Clic` en el PDF para regresar directamente a la línea correspondiente en Neovim.*
