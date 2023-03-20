# NeoVim

---
## Dependências

### Packer
O packer é o package manager do neovim.
[Packer](https://github.com/wbthomason/packer.nvim)

### ripgrep
O ripgrep é uma versão melhorado do grep padrão.
baixar o `ripgrep` para pesquisar em arquivos varios arquivos ao mesmo tempo

### Compilador de c
O que esta como padrão é o `clang`, mas outros podem ser utilizados.

#### clang 
A melhor opção.

### fd
O fd possui comando de find melhorados que são utilizados dentro de alguns plugins do nvim.
'sharpkdp/fd'

---
## Extras

### Windows terminal
O melhor simulador de terminal do nvim para windows

Remover o padding padrão, mudar fonte do windows terminal e tamanho da fonte para 11.
```json
"defaults": 
        {
            "font": 
            {
                "face": "JetBrainsMono Nerd Font Mono"
            },
            "padding": "0",
            "scrollbarState": "hidden"
},
```

### Powershell 7
O melhor terminal para windows
