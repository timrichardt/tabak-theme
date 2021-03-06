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
- [X] undo-tree
- [X] ido
- [X] rainbow-delimiters (In actual rainbow colors! 🌈)
- [X] Magit
- [X] Org
- [X] Cider
- [X] SLIME
- [X] ERC
- [ ] mu4e (from 2015, probably deprecated)

Please, report any problems on the issue tracker. If you want to add something, do not hesitate
to send a pull request.

## Installation

### Manual

Either from [MELPA](https://melpa.org/), `M-x package-install RET tabak-theme RET`, or
by copying the repo into your `load-path`. Then

```
(require 'tabak-theme)

;; light variant
(tabak-theme-light)

;; dark variant
(tabak-theme-dark)
```

`tabak-theme` uses `frame-background-mode` to determine
colors. To toggle between dark and light variants, the function
`tabak-theme-toggle` is provided. It is convenient to bind this globally,
for example

```
(global-set-key (kbd "<C-F12>") 'tabak-theme-toggle)
```

### use-package

```
(use-package tabak-theme
  :commands (tabak-theme-dark)
  :init (tabak-theme-dark)
  :bind (("<C-F12>" . tabak-theme-toggle)))
```


## License

Please, see [LICENSE](/LICENSE)