# tabak-theme

[![MELPA](http://melpa.org/packages/tabak-theme-badge.svg)](http://melpa.org/#/tabak-theme)
[![MELPA Stable](http://stable.melpa.org/packages/tabak-theme-badge.svg)](http://stable.melpa.org/#/tabak-theme)

## About

![Preview image of `tabak-theme`](https://raw.githubusercontent.com/timrichardt/tabak-theme/master/preview.png)

Tabak is a [zenburn](https://kippura.org/zenburnpage/) inspired
theme with a dark and light variant. It comes with warm and mellow
color palettes, and waives loud highlighting in favor of decent
but still recognizable and consistent decorations.

Currently, the following is covered
- [X] font-lock
- [X] widgets
- [X] show-paren
- [X] ido
- [X] rainbow-delimiters (In actual rainbow colors! 🌈)
- [X] Magit
- [X] Cider
- [X] SLIME
- [X] ERC
- [ ] mu4e (from 2015, probably deprecated)

Please, report any problems on the issue tracker. Also do not hesitate
to send a pull request, if you want to add something.

## Installation

### Manual

Either from [MELPA](https://melpa.org/), `M-x package-install RET tabak-theme RET`, or
by copying into your `load-path`. Then

```
(require 'tabak-theme)

;; light variant
(tabak-theme-light)

;; dark variant
(tabak-theme-dark)
```

`tabak-theme` utilizes Emacs's `frame-background-mode` to determine
colors. To toggle between dark and light variants the function
`tabak-toggle` is provided. I is convenient to bind this globally,
for example

```
(global-set-key (kbd "<C-F12>") 'tabak-toggle)
```

### use-package

```
(use-package tabak-theme
  :commands (tabak-theme-dark)
  :init (tabak-theme-dark)
  :bind (("<C-F12>" . tabak-toggle)))
```


## License

```
----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 42):
<tim@richardt.io> wrote this file.  As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return.   Tim Richardt
----------------------------------------------------------------------------
```