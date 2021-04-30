# tabak-theme

![Preview image of `tabak-theme`](https://raw.githubusercontent.com/timrichardt/tabak-theme/master/preview.png)

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