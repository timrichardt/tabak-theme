# tabak-theme

![Preview image of `tabak-theme`](https://raw.githubusercontent.com/timrichardt/tabak-theme/master/preview.png)

## Usage

Put the `tabak-theme.el` in your `load-path` and

```
(require 'tabak-theme)
```

`tabak-theme` utilizes Emacs's `frame-background-mode` to determine
colors. To toggle between dark and light variants the function
`tabak-toggle` is provided. It is convenient to bind this function to
a keystroke, for example

```
(global-set-key (kbd "<C-F12>") 'tabak-toggle)
```