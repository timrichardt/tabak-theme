;;; tabak-theme.el --- A mellow theme with dark and light variants -*- lexical-binding: t -*-

;; Copyright (C) 2015-2021 Tim Richardt

;; Author: Tim Richardt <tim@richardt.io>
;; URL: https://github.com/timrichardt/tabak-theme
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.1"))
;; SPDX-License-Identifier: Beerware

;; /*
;; * ----------------------------------------------------------------------------
;; * "THE BEER-WARE LICENSE" (Revision 42):
;; * <phk@FreeBSD.ORG> wrote this file. As long as you retain this notice you
;; * can do whatever you want with this stuff. If we meet some day, and you think
;; * this stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
;; * ----------------------------------------------------------------------------
;; */


;;; Commentary:

;;
;;              ████████╗ █████╗ ██████╗  █████╗ ██╗  ██╗
;;              ╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝
;;                 ██║   ███████║██████╔╝███████║█████╔╝
;;                 ██║   ██╔══██║██╔══██╗██╔══██║██╔═██╗
;;                 ██║   ██║  ██║██████╔╝██║  ██║██║  ██╗
;;                 ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;;                        C O L O R   T H E M E
;; 


;;; Code:

(deftheme tabak
  "A mellow color theme.
The dark palette is a brownish variation of the famous zenburn. The light
palette, in contrast, is higher in contrast.")

(defvar tabak-palette
  '(("background-d" "#edd9ca" "#2e2926")
    ("background"   "#e8d1c0" "#38322e")
    ("background-l" "#d4bfaf" "#524943")
    ("gray-d"       "#7a6b62" "#aaa89c")
    ("gray"         "#4f473f" "#dcd8ca")
    ("gray-l"       "#332d29" "#faf5ec")
    ("brown-d"      "#684d39" "#877064")
    ("brown"        "#936543" "#ad8f80")
    ("brown-l"      "#c48759" "#c4a595")
    ("red-d"        "#ab3232" "#ac6363")
    ("red"          "#d44a4a" "#cc8383")
    ("red-l"        "#f73939" "#e5a3a3")
    ("yellow-d"     "#946b0d" "#c0af7f")
    ("yellow"       "#bd8400" "#ebdda9")
    ("yellow-l"     "#de9b00" "#fefecc")
    ("green-d"      "#164f0d" "#5a6c5a")
    ("green"        "#217813" "#7f9f7f")
    ("green-l"      "#32a61f" "#afdeaf")
    ("blue-d"       "#0f7f9f" "#5b7b85")
    ("blue"         "#129cc4" "#8dacb5")
    ("blue-l"       "#16b9e8" "#a9d7d9")
    ("violet-d"     "#682485" "#897f94")
    ("violet"       "#842ea8" "#b4a9c2")
    ("violet-l"     "#a64bcc" "#ddd1ed"))
  "The tabak color palette.
The second and third column hold the values for
the light and dark variant of the colorname in the first column.")

(defsubst tabak-color-light (name)
  "Return light color value for NAME from TABAK-PALETTE."
  (nth 1 (assoc name tabak-palette)))

(defsubst tabak-color-dark (name)
  "Return dark color value for NAME from TABAK-PALETTE."
  (nth 2 (assoc name tabak-palette)))

(defun tabak-face (&rest spec)
  "Return a face specification.
SPEC has to be a property list with face
properties.  Foreground and background have to have values of colornames of
TABAK-PALETTE.  TABAK-FACE evaluates to a face specification with display
properties dark and light and the colornames replaced by their values from
TABAK-PALETTE."
  (let ((light (copy-sequence spec))
        (dark (copy-sequence spec)))

    (dolist (key '(:foreground :background))
      (when (plist-member spec key)
        (plist-put light key (tabak-color-light
                              (plist-get spec key)))
        (plist-put dark key (tabak-color-dark
                             (plist-get spec key)))))

    `((((background light)) ,light)
      (((background dark)) ,dark))))

(custom-theme-set-faces
 'tabak
 
 ;; default face
 `(default
    ,(tabak-face :background "background" :foreground "gray"))
 `(fringe
   ,(tabak-face :foreground "background-l" :background "background"))
 `(region
   ,(tabak-face :foreground "green-l" :background "green-d"))
 `(link
   ,(tabak-face :foreground "violet-l" :weight 'bold :underline nil))
 `(secondary-selection
   ,(tabak-face :foreground "background" :background "violet-d"))
 `(highlight
   ,(tabak-face :foreground "yellow" :background "background-l"))
 `(match
   ,(tabak-face :foreground "yellow-l" :background "brown-d"))
 `(paren
   ,(tabak-face :foreground "gray-d"))
 `(warning
   ,(tabak-face :foreground "red" :weight 'bold))
 `(success
   ,(tabak-face :foreground "green" :weight 'bold))
 `(error
   ,(tabak-face :foreground "red" :weight 'bold))
 `(mode-line
   ,(tabak-face :foreground "background" :background "red-l"
                :box nil))
 `(mode-line-inactive
   ,(tabak-face :foreground "background" :background "brown-d"
                :box nil
                :weight 'normal))
 `(mode-line-buffer-id
   ,(tabak-face :weight 'bold :slant 'italic))
 `(minibuffer-prompt
   ,(tabak-face :foreground "yellow-l"))
 `(buffer-menu-buffer
   ,(tabak-face :foreground "yellow" :weight 'bold))
 `(cursor
   ,(tabak-face :inherit 'default :weight 'bold))
 `(hover-highlight
   ,(tabak-face :foreground "yellow" :background "background-l"))
 `(mouse
   ,(tabak-face :foreground "gray"))
 `(scroll-bar
   ,(tabak-face :background "background-l"))
 `(tool-bar
   ,(tabak-face :background "background-l"))
 `(border
   ,(tabak-face :foreground "background"))
 `(header-line
   ,(tabak-face :foreground "gray" :background "background-d" :weight 'bold))

 ;; font-lock settings
 `(font-lock-builtin-face
   ,(tabak-face :foreground "yellow"))
 `(font-lock-comment-face
   ,(tabak-face :foreground "green"))
 `(font-lock-comment-delimiter-face
   ,(tabak-face :foreground "background-l"))
 `(font-lock-constant-face
   ,(tabak-face :foreground "gray"))
 `(font-lock-doc-face
   ,(tabak-face :foreground "green"))
 `(font-lock-function-name-face
   ,(tabak-face :foreground "gray"))
 `(font-lock-keyword-face
   ,(tabak-face :foreground "gray"))
 `(font-lock-negation-char-face
   ,(tabak-face :foreground "gray"))
 `(font-lock-preprocessor-face
   ,(tabak-face :foreground "violet"))
 `(font-lock-string-face
   ,(tabak-face :foreground "gray-d"))
 `(font-lock-type-face
   ,(tabak-face :foreground "gray-l" :weight 'bold :slant 'italic))
 `(font-lock-variable-name-face
   ,(tabak-face :foreground "gray"))
 `(font-lock-warning-face
   ,(tabak-face :foreground "gray"))
 `(font-lock-pseudo-keyword-face
   ,(tabak-face :foreground "gray"))
 `(font-lock-operator-face
   ,(tabak-face :foreground "gray"))

 ;; show-paren
 `(show-paren-match
   ,(tabak-face :background "background-l"))
 `(show-paren-mismatch
   ,(tabak-face :background "red"))

 ;; widgets
 `(button
   ,(tabak-face :foreground "background" :background "red-d"
                :box '(:line-width 1 :style released-button)))
 `(button-pressed
   ,(tabak-face :foreground "background" :background "red-d"
                :box '(:line-width 1 :style pressed-button)))
 `(button-highlight
   ,(tabak-face :foreground "background" :background "red-l"
                :box '(:line-width 1 :style released-button)))
 `(button-pressed-highlight
   ,(tabak-face :foreground "red-l" :background "red-l"
                :box '(:line-width 1 :style pressed-button)))
 `(widget-documentation
   ,(tabak-face :inherit 'fancy-documentation))
 `(widget-field
   ,(tabak-face :foreground "gray" :background "background-l"
                :box '(:line-width 1 :style pressed-button)))
 `(widget-inactive
   ,(tabak-face :foreground "gray-d" :background "background-d"
                :box '(:line-width 1 :style pressed-button)))
 `(widget-single-line-field
   ,(tabak-face :foreground "gray" :background "background-l"
                :box '(:line-width 1 :style pressed-button)))
 
 ;; plain-widget
 `(plain-widget-button
   ,(tabak-face :inherit 'button))
 `(plain-widget-button-pressed
   ,(tabak-face :inherit 'button-pressed))
 `(plain-widget-documentation
   ,(tabak-face :inherit 'font-lock-doc))
 `(plain-widget-field
   ,(tabak-face :foreground "brown-l"))
 `(plain-widget-inactive
   ,(tabak-face :foreground "gray-d"))
 `(plain-widget-single-line-field
   ,(tabak-face :background "green-d"))
 
 ;; custom
 `(custom-button
   ,(tabak-face :foreground "background" :background "red-d"
                :box '(:line-width 1 :style released-button)))
 `(custom-button-mouse
   ,(tabak-face :foreground "background" :background "red-l"
                :box '(:line-width 1 :style released-button)))
 `(custom-button-pressed
   ,(tabak-face :foreground "background" :background "red-l"
                :box '(:line-width 1 :style pressed-button)))
 `(custom-button-pressed-unraised
   ,(tabak-face :foreground "background" :background "red"
                :box '(:line-width 1 :style pressed-button)))
 `(custom-button-unraised
   ,(tabak-face :foreground "background" :background "red"
                :box '(:line-width 1 :style released-button)))
 `(custom-changed
   ,(tabak-face :foreground "yellow"))
 `(custom-comment
   ,(tabak-face :foreground "green"))
 `(custom-comment-tag
   ,(tabak-face :foreground "yellow"))
 `(custom-documentation
   ,(tabak-face :foreground "gray"))
 `(custom-face-tag
   ,(tabak-face :foreground "brown"))
 `(custom-group-subtitle
   ,(tabak-face :foreground "brown-l"))
 `(custom-group-tag
   ,(tabak-face :foreground "brown"))
 `(custom-group-tag-1
   ,(tabak-face :foreground "gray-l"))
 `(custom-invalid
   ,(tabak-face :foreground "red"))
 `(custom-link
   ,(tabak-face :foreground "violet"))
 `(custom-modified
   ,(tabak-face :foreground "green" :background "background-l"))
 `(custom-rogue
   ,(tabak-face :foreground "background-l" :background "background"))
 `(custom-saved
   ,(tabak-face :foreground "gray"))
 `(custom-set
   ,(tabak-face :foreground "gray-l"))
 `(custom-state
   ,(tabak-face :foreground "gray"))
 `(custom-themed
   ,(tabak-face :foreground "background" :background "gray-l"))
 `(custom-variable-button
   ,(tabak-face :foreground "gray" :background "background-l"
                :underline nil
                :weight 'bold
                :box nil))
 `(custom-variable-tag
   ,(tabak-face :foreground "gray" :background "background"
                :underline nil
                :box nil))
 `(custom-visibility
   ,(tabak-face :foreground "gray" :weight 'bold))
 
 ;; ido
 `(ido-first-match
   ,(tabak-face :foreground "yellow"))
 `(ido-only-match
   ,(tabak-face :foreground "yellow" :weight 'bold))
 `(ido-subdir
   ,(tabak-face :foreground "yellow"))
 `(isearch
   ,(tabak-face :foreground "background" :background "violet-d"))
 `(isearch-fail
   ,(tabak-face :foreground "background" :background "red-d"))
 `(isearch-lazy-highlight
   ,(tabak-face :foreground "background" :background "green-d"))
 
 ;; undo-tree
 `(undo-tree-visualizer-active-branch-face
   ,(tabak-face :foreground "violet"))
 `(undo-tree-visualizer-current-face
   ,(tabak-face :foreground "violet-l"))
 `(undo-tree-visualizer-default-face
   ,(tabak-face :foreground "gray-d"))
 `(undo-tree-visualizer-register-face
   ,(tabak-face :foreground "yellow"))
 `(undo-tree-visualizer-unmodified-face
   ,(tabak-face :foreground "blue"))
 
 ;; rainbow delimiters
 `(rainbow-delimiters-depth-1-face
   ,(tabak-face :foreground "gray"))
 `(rainbow-delimiters-depth-2-face
   ,(tabak-face :foreground "violet-d"))
 `(rainbow-delimiters-depth-3-face
   ,(tabak-face :foreground "blue-d"))
 `(rainbow-delimiters-depth-4-face
   ,(tabak-face :foreground "blue"))
 `(rainbow-delimiters-depth-5-face
   ,(tabak-face :foreground "green-l"))
 `(rainbow-delimiters-depth-6-face
   ,(tabak-face :foreground "yellow-l"))
 `(rainbow-delimiters-depth-7-face
   ,(tabak-face :foreground "yellow"))
 `(rainbow-delimiters-depth-8-face
   ,(tabak-face :foreground "red"))
 `(rainbow-delimiters-depth-9-face
   ,(tabak-face :foreground "red-d"))
 `(rainbow-delimiters-unmatched-face
   ,(tabak-face :foreground "red-l" :background "red-d"))
 
 ;; mu4e
 `(mu4e-cited-7-face
   ,(tabak-face :foreground "gray-d"))
 `(mu4e-cited-6-face
   ,(tabak-face :foreground "gray"))
 `(mu4e-cited-5-face
   ,(tabak-face :foreground "brown-d"))
 `(mu4e-cited-4-face
   ,(tabak-face :foreground "brown"))
 `(mu4e-cited-3-face
   ,(tabak-face :foreground "brown-l"))
 `(mu4e-cited-2-face
   ,(tabak-face :foreground "gray-l"))
 `(mu4e-cited-1-face
   ,(tabak-face :foreground "gray-d"))
 `(mu4e-compose-header-face
   ,(tabak-face :foreground "brown"))
 `(mu4e-compose-separator-face
   ,(tabak-face :foreground "brown-l"))
 `(mu4e-contact-face
   ,(tabak-face :foreground "gray-l"))
 `(mu4e-draft-face
   ,(tabak-face :foreground "red"))
 `(mu4e-footer-face
   ,(tabak-face :foreground "gray-d"))
 `(mu4e-title-face
   ,(tabak-face :foreground "gray"))
 `(mu4e-unread-face
   ,(tabak-face :foreground "yellow"))
 `(mu4e-forwarded-face
   ,(tabak-face :foreground "green-l"))
 `(mu4e-flagged-face
   ,(tabak-face :foreground "violet-l"))
 `(mu4e-moved-face
   ,(tabak-face :foreground "red"))
 `(mu4e-replied-face
   ,(tabak-face :foreground "green-l"))
 `(mu4e-trashed-face
   ,(tabak-face :foreground "gray-d"))
 `(mu4e-header-face
   ,(tabak-face :foreground "gray"))
 `(mu4e-header-key-face
   ,(tabak-face :foreground "brown" :weight 'normal))
 `(mu4e-header-value-face
   ,(tabak-face :foreground "gray"))
 `(mu4e-header-marks-face
   ,(tabak-face :foreground "yellow" :weight 'bold
                :slant 'italic))
 `(mu4e-header-highlight-face
   ,(tabak-face :foreground "yellow" :background "background-l"
                :weight 'normal :underline nil))
 `(mu4e-header-title-face
   ,(tabak-face :foreground "gray" :weight 'bold))
 `(mu4e-highlight-face
   ,(tabak-face :foreground "yellow-l"))
 `(mu4e-special-header-value-face
   ,(tabak-face :foreground "yellow-l"))
 `(mu4e-link-face
   ,(tabak-face :foreground "violet-l" :underline t))
 `(mu4e-ok-face
   ,(tabak-face :foreground "green" :weight 'bold))
 `(mu4e-system-face
   ,(tabak-face :foreground "green" :slant 'italic))
 `(mu4e-url-number-face
   ,(tabak-face :foreground "gray-d"))
 `(mu4e-attach-number-face
   ,(tabak-face :foreground "gray-d"))
 `(mu4e-warning-face
   ,(tabak-face :foreground "red-l" :background "red-d"))
 
 ;; message composition
 `(message-cited-text
   ,(tabak-face :foreground "gray-d"))
 `(message-header-cc
   ,(tabak-face :foreground "gray-l" :weight 'normal))
 `(message-header-name
   ,(tabak-face :foreground "brown"))
 `(message-header-newsgroups
   ,(tabak-face :foreground "gray"))
 `(message-header-other
   ,(tabak-face :foreground "gray"))
 `(message-header-subject
   ,(tabak-face :foreground "gray"))
 `(message-header-to
   ,(tabak-face :foreground "gray-l" :weight 'normal))
 `(message-header-xheader
   ,(tabak-face :foreground "brown"))
 `(message-mml
   ,(tabak-face :foreground "yellow"))
 `(message-separator
   ,(tabak-face :foreground "brown-l"))
 
 ;; org
 `(org-default
   ,(tabak-face :inherit 'default))
 `(org-document-info
   ,(tabak-face :foreground "gray-l"))
 `(org-document-info-keyword
   ,(tabak-face :foreground "gray-l" :weight 'bold))
 `(org-document-title
   ,(tabak-face :foreground "gray-l" :slant 'italic))
 `(org-level-8
   ,(tabak-face :foreground "gray-d" :weight 'normal))
 `(org-level-7
   ,(tabak-face :foreground "gray-d" :weight 'normal))
 `(org-level-6
   ,(tabak-face :foreground "gray" :weight 'normal))
 `(org-level-5
   ,(tabak-face :foreground "brown-d" :weight 'normal))
 `(org-level-4
   ,(tabak-face :foreground "brown" :weight 'normal))
 `(org-level-3
   ,(tabak-face :foreground "brown-l" :weight 'normal))
 `(org-level-2
   ,(tabak-face :foreground "gray-l" :weight 'normal))
 `(org-level-1
   ,(tabak-face :foreground "gray" :weight 'normal))
 `(org-agenda-date
   ,(tabak-face :foreground "gray" :slant 'italic))
 `(org-agenda-date-today
   ,(tabak-face :foreground "gray" :weight 'bold :slant 'italic))
 `(org-agenda-date-weekend
   ,(tabak-face :foreground "green" :slant 'italic))
 `(org-agenda-structure
   ,(tabak-face :foreground "brown"))
 `(org-time-grid
   ,(tabak-face :foreground "brown"))
 `(org-agenda-calendar-event
   ,(tabak-face :foreground "gray"))
 `(org-agenda-calendar-sexp
   ,(tabak-face :foreground "gray"))
 `(org-agenda-clocking
   ,(tabak-face :foreground "red"))
 `(org-agenda-column-dateline
   ,(tabak-face :foreground "red-l"))
 `(org-agenda-current-time
   ,(tabak-face :foreground "gray-l"))
 `(org-agenda-diary
   ,(tabak-face :foreground "gray"))
 `(org-agenda-dimmed-todo-face
   ,(tabak-face :foreground "red-d"))
 `(org-agenda-done
   ,(tabak-face :foreground "green"))
 `(org-agenda-filter-category
   ,(tabak-face :foreground "gray"))
 `(org-agenda-filter-regexp
   ,(tabak-face :foreground "gray"))
 `(org-agenda-filter-tags
   ,(tabak-face :foreground "gray"))
 `(org-agenda-restriction-lock
   ,(tabak-face :foreground "gray"))
 `(org-scheduled
   ,(tabak-face :foreground "gray"))
 `(org-scheduled-previously
   ,(tabak-face :foreground "gray"))
 `(org-scheduled-today
   ,(tabak-face :foreground "gray"))
 `(org-archived
   ,(tabak-face :foreground "gray"))
 `(org-clock-overlay
   ,(tabak-face :foreground "gray"))
 `(org-todo
   ,(tabak-face :foreground "red" :weight 'bold :slant 'italic))
 `(org-column
   ,(tabak-face :foreground "gray"))
 `(org-column-title
   ,(tabak-face :foreground "gray"))
 `(org-mode-line-clock
   ,(tabak-face :foreground "gray"))
 `(org-mode-line-clock-overrun
   ,(tabak-face :foreground "gray"))
 `(org-priority
   ,(tabak-face :foreground "blue" :weight 'bold :slant 'italic))
 `(org-property-value
   ,(tabak-face :foreground "gray"))
 `(org-quote
   ,(tabak-face :foreground "gray"))
 `(org-special-keyword
   ,(tabak-face :foreground "yellow"))
 `(org-table
   ,(tabak-face :foreground "brown"))
 `(org-tag
   ,(tabak-face :foreground "yellow" :weight 'bold))
 `(org-tag-group
   ,(tabak-face :foreground "yellow-l" :weight 'bold))
 `(org-target
   ,(tabak-face :foreground "gray"))
 `(org-upcoming-deadline
   ,(tabak-face :foreground "red" :background "background"))
 `(org-verbatim
   ,(tabak-face :foreground "gray"))
 `(org-verse
   ,(tabak-face :foreground "gray"))
 `(org-date
   ,(tabak-face :foreground "yellow"))
 `(org-sexp-date
   ,(tabak-face :foreground "gray"))
 `(org-date-selected
   ,(tabak-face :foreground "gray"))
 `(org-code
   ,(tabak-face :foreground "brown"))
 `(org-meta-line
   ,(tabak-face :foreground "gray"))
 `(org-block
   ,(tabak-face :foreground "gray"))
 `(org-block-background
   ,(tabak-face :foreground "gray"))
 `(org-block-begin-line
   ,(tabak-face :foreground "gray"))
 `(org-block-end-line
   ,(tabak-face :foreground "gray"))
 `(org-checkbox
   ,(tabak-face :foreground "gray"))
 `(org-checkbox-statistics-done
   ,(tabak-face :foreground "gray"))
 `(org-checkbox-statistics-todo
   ,(tabak-face :foreground "gray"))
 `(org-done
   ,(tabak-face :foreground "green-l" :weight 'bold :slant 'italic))
 `(org-drawer
   ,(tabak-face :foreground "gray"))
 `(org-ellipsis
   ,(tabak-face :foreground "gray"))
 `(org-footnote
   ,(tabak-face :foreground "gray"))
 `(org-formula
   ,(tabak-face :foreground "gray"))
 `(org-headline-done
   ,(tabak-face :foreground "gray"))
 `(org-hide
   ,(tabak-face :foreground "gray"))
 `(org-latex-and-related
   ,(tabak-face :foreground "gray"))
 `(org-link
   ,(tabak-face :foreground "violet-l"))
 `(org-list-dt
   ,(tabak-face :foreground "gray"))
 `(org-macro
   ,(tabak-face :foreground "gray"))
 `(org-warning
   ,(tabak-face :foreground "red-l"))
 `(org-habit-alert-face
   ,(tabak-face :foreground "background-l" :background "yellow"))
 `(org-habit-alert-future-face
   ,(tabak-face :foreground "background-l" :background "yellow-d"))
 `(org-habit-clear-face
   ,(tabak-face :foreground "green" :background "background-l"))
 `(org-habit-clear-future-face
   ,(tabak-face :foreground "background-l" :background "background-l"))
 `(org-habit-overdue-face
   ,(tabak-face :foreground "background-l" :background "red-d"))
 `(org-habit-overdue-future-face
   ,(tabak-face :foreground "background-l" :background "red"))
 `(org-habit-ready-face
   ,(tabak-face :foreground "background-l" :background "green-d"))
 `(org-habit-ready-future-face
   ,(tabak-face :foreground "background-l" :background "green"))
 
 ;; info
 `(info-header-node
   ,(tabak-face :foreground "brown" :weight 'bold))
 `(info-header-xref
   ,(tabak-face :foreground "violet-l" :weight 'normal :underline nil))
 `(info-menu-header
   ,(tabak-face :foreground "brown-l" :weight 'bold))
 `(info-menu-star
   ,(tabak-face :foreground "red" :weight 'bold))
 `(info-node
   ,(tabak-face :foreground "brown" :weight 'bold))
 `(info-title-1
   ,(tabak-face :foreground "brown-l" :weight 'bold))
 `(info-title-2
   ,(tabak-face :foreground "brown" :weight 'bold))
 `(info-title-3
   ,(tabak-face :foreground "brown-d" :weight 'bold))
 `(info-title-4
   ,(tabak-face :foreground "gray-l" :weight 'bold))
 `(info-xref
   ,(tabak-face :foreground "violet-l"))
 `(info-xref-visited
   ,(tabak-face :foreground "violet"))
 
 ;; ess
 `(ess-%op%-face
   ,(tabak-face :foreground "yellow"))
 `(ess-bp-fringe-browser-face
   ,(tabak-face :foreground "yellow"))
 `(ess-bp-fringe-inactive-face
   ,(tabak-face :foreground "brown"))
 `(ess-bp-fringe-logger-face
   ,(tabak-face :foreground "blue"))
 `(ess-bp-fringe-recover-face
   ,(tabak-face :foreground "green"))
 `(ess-debug-blink-ref-not-found-face
   ,(tabak-face :foreground "red-l" :background "red-d"))
 `(ess-debug-blink-same-ref-face
   ,(tabak-face :foreground "blue-l" :background "blue-d"))
 `(ess-debug-current-debug-line-face
   ,(tabak-face :foreground "gray" :background "brown-d"))
 `(ess-developer-indicator-face
   ,(tabak-face :foreground "yellow" :weight 'bold))
 `(ess-function-call-face
   ,(tabak-face :foreground "yellow"))
 `(ess-numbers-face
   ,(tabak-face :foreground "violet"))
 `(ess-tracebug-last-input-fringe-face
   ,(tabak-face :foreground "gray"))
 `(ess-watch-current-block-face
   ,(tabak-face :foreground "gray" :backgorund "background-l"))
 
 ;; slime
 `(slime-apropos-label
   ,(tabak-face :foreground "brown-l"))
 `(slime-apropos-symbol
   ,(tabak-face :foreground "brown-l"))
 `(slime-error-face
   ,(tabak-face :foreground "red-l" :background "red-d"))
 `(slime-highlight-face
   ,(tabak-face :foreground "yellow" :background "background-l"))
 `(slime-inspector-action-face
   ,(tabak-face :foreground "yellow-l"))
 `(slime-inspector-label-face
   ,(tabak-face :foreground "blue"))
 `(slime-inspector-topline-face
   ,(tabak-face :foreground "brown"))
 `(slime-inspector-type-face
   ,(tabak-face :foreground "gray-l" :weight 'bold))
 `(slime-inspector-value-face
   ,(tabak-face :foreground "gray-d"))
 `(slime-note-face
   ,(tabak-face :foreground "brown"))
 `(slime-repl-input-face
   ,(tabak-face :foreground "gray"))
 `(slime-repl-inputed-output-face
   ,(tabak-face :foreground "yellow"))
 `(slime-repl-output-face
   ,(tabak-face :foreground "gray-l"))
 `(slime-repl-prompt-face
   ,(tabak-face :foreground "yellow-l"))
 `(slime-repl-result-face
   ,(tabak-face :foreground "gray"))
 `(slime-style-warning-face
   ,(tabak-face :foreground "red-l" :background "background-l"))
 `(slime-warning-face
   ,(tabak-face :foreground "red-l" :background "red-d"))
 `(sldb-catch-tag-face
   ,(tabak-face :foreground "red"))
 `(sldb-condition-face
   ,(tabak-face :foreground "gray-l" :weight 'bold))
 `(sldb-detailed-frame-line-face
   ,(tabak-face :foreground "gray-l"))
 `(sldb-frame-label-face
   ,(tabak-face :foreground "gray"))
 `(sldb-frame-line-face
   ,(tabak-face :foreground "blue"))
 `(sldb-local-name-face
   ,(tabak-face :foreground "gray-l"))
 `(sldb-local-value-face
   ,(tabak-face :foreground "gray-d"))
 `(sldb-non-restartable-frame-line-face
   ,(tabak-face :foreground "gray-d"))
 `(sldb-restart-face
   ,(tabak-face :foreground "gray"))
 `(sldb-restart-number-face
   ,(tabak-face :foreground "yellow-l" :weight 'normal))
 `(sldb-restart-type-face
   ,(tabak-face :foreground "yellow-l"))
 `(sldb-restartable-frame-line-face
   ,(tabak-face :foreground "green"))
 `(sldb-section-face
   ,(tabak-face :foreground "brown" :background "background" :weight 'bold))
 `(sldb-topline-face
   ,(tabak-face :foreground "gray"))

 ;; latex
 `(font-latex-bold-face
   ,(tabak-face :weight 'bold))
 `(font-latex-doctex-documentation-face
   ,(tabak-face :foreground "green"))
 `(font-latex-doctex-preprocessor-face
   ,(tabak-face :foreground "blue"))
 `(font-latex-italic-face
   ,(tabak-face :slant 'italic))
 `(font-latex-math-face
   ,(tabak-face :foreground "gray"))
 `(font-latex-sectioning-0-face
   ,(tabak-face :foreground "gray-l"))
 `(font-latex-sectioning-1-face
   ,(tabak-face :foreground "brown-l"))
 `(font-latex-sectioning-2-face
   ,(tabak-face :foreground "brown"))
 `(font-latex-sectioning-3-face
   ,(tabak-face :foreground "brown-d"))
 `(font-latex-sectioning-4-face
   ,(tabak-face :foreground "gray-d"))
 `(font-latex-sectioning-5-face
   ,(tabak-face :foreground "gray-l"))
 `(font-latex-sedate-face
   ,(tabak-face :foreground "yellow"))
 `(font-latex-slide-title-face
   ,(tabak-face :foreground "brown"))
 `(font-latex-string-face
   ,(tabak-face :foreground "gray-d"))
 `(font-latex-subscript-face
   ,(tabak-face :foreground "gray-d"))
 `(font-latex-superscript-face
   ,(tabak-face :foreground "gray-d"))
 `(font-latex-verbatim-face
   ,(tabak-face :foreground "gray-d"))
 `(font-latex-warning-face
   ,(tabak-face :foreground "red"))

 ;; easypg assistant
 `(epa-field-body
   ,(tabak-face :foreground "gray"))
 `(epa-field-name
   ,(tabak-face :foreground "brown"))
 `(epa-mark
   ,(tabak-face :foreground "blue"))
 `(epa-string
   ,(tabak-face :foreground "green"))
 `(epa-validity-disabled
   ,(tabak-face :foreground "gray"))
 `(epa-validity-high
   ,(tabak-face :foreground "green"))
 `(epa-validity-low
   ,(tabak-face :foreground "brown"))
 `(epa-validity-medium
   ,(tabak-face :foreground "brown-l"))

 ;; erc
 `(erc-action-face
   ,(tabak-face :foreground "yellow"))
 `(erc-bold-face
   ,(tabak-face :weight 'bold))
 `(erc-button
   ,(tabak-face :foreground "background" :background "red-d"
                :box '(:line-width 1 :style released-button)))
 `(erc-command-indicator-face
   ,(tabak-face :foreground "green"))
 `(erc-current-nick-face
   ,(tabak-face :foreground "gray-l"))
 `(erc-dangerous-host-face
   ,(tabak-face :foreground "red"))
 `(erc-default-face
   ,(tabak-face :foreground "gray"))
 `(erc-direct-msg-face
   ,(tabak-face :foreground "gray-d"))
 `(erc-error-face
   ,(tabak-face :foreground "red-l" :background "red-d"))
 `(erc-fool-face
   ,(tabak-face :foreground "violet"))
 `(erc-header-line
   ,(tabak-face :foreground "green-l" :background "green-d"))
 `(erc-input-face
   ,(tabak-face :foreground "gray"))
 `(erc-inverse-face
   ,(tabak-face :foreground "background" :background "gray"))
 `(erc-keyword-face
   ,(tabak-face :foreground "yellow"))
 `(erc-my-nick-face
   ,(tabak-face :foreground "gray-l"))
 `(erc-my-nick-prefix-face
   ,(tabak-face :foreground "blue-l"))
 `(erc-nick-default-face
   ,(tabak-face :foreground "brown"))
 `(erc-nick-msg-face
   ,(tabak-face :foreground "brown-d"))
 `(erc-nick-prefix-face
   ,(tabak-face :foreground "blue-l"))
 `(erc-notice-face
   ,(tabak-face :foreground "yellow" :background "background-l"))
 `(erc-pal-face
   ,(tabak-face :foreground "red"))
 `(erc-prompt-face
   ,(tabak-face :foreground "yellow-l"))
 `(erc-timestamp-face
   ,(tabak-face :foreground "gray-d"))
 `(erc-underline-face
   ,(tabak-face :underline t))
 
 ;; magit
 `(magit-bisect-bad
   ,(tabak-face :foreground "red"))
 `(magit-bisect-good
   ,(tabak-face :foreground "green"))
 `(magit-bisect-skip
   ,(tabak-face :foreground "gray-d"))

 ;; `(magit-blame-date
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-blame-hash
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-blame-heading
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-blame-name
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-blame-summary
 ;;   ,(tabak-face :foreground "gray"))

 `(magit-branch-current
   ,(tabak-face :foreground "green"))
 `(magit-branch-local
   ,(tabak-face :foreground "brown"))
 `(magit-branch-remote
   ,(tabak-face :foreground "gray"))

 ;; `(magit-cherry-equivalent
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-cherry-unmatched
 ;;   ,(tabak-face :foreground "gray"))

 `(magit-diff-added
   ,(tabak-face :foreground "green-d"))
 `(magit-diff-added-highlight
   ,(tabak-face :foreground "green" :background "background-l"))
 `(magit-diff-base
   ,(tabak-face :foreground "yellow"))
 `(magit-diff-base-highlight
   ,(tabak-face :foreground "yellow" :background "background-l"))
 `(magit-diff-conflict-heading
   ,(tabak-face :foreground "red"))
 `(magit-diff-context
   ,(tabak-face :foreground "gray"))
 `(magit-diff-context-highlight
   ,(tabak-face :foreground "gray" :background "background-l"))
 `(magit-diff-file-heading
   ,(tabak-face :foreground "gray"))
 `(magit-diff-file-heading-highlight
   ,(tabak-face :foreground "gray"))
 `(magit-diff-file-heading-selection
   ,(tabak-face :foreground "gray"))
 `(magit-diff-hunk-heading
   ,(tabak-face :foreground "brown"
                :weight 'bold))
 `(magit-diff-hunk-heading-highlight
   ,(tabak-face :foreground "background"
                :background "brown"
                :underline nil
                :weight 'bold))
 `(magit-diff-hunk-heading-selection
   ,(tabak-face :foreground "gray"))

 ;; `(magit-diff-lines-boundary
 ;;   ,(tabak-face :foreground "yellow"))

 `(magit-diff-lines-heading
   ,(tabak-face :foreground "violet-d"
                :background "background-d"
                :weight 'bold))

 ;; `(magit-diff-our
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-diff-our-highlight
 ;;   ,(tabak-face :foreground "gray"))

 `(magit-diff-removed
   ,(tabak-face :foreground "red-d"))
 `(magit-diff-removed-highlight
   ,(tabak-face :foreground "red" :background "background-l"))

 ;; `(magit-diff-their
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-diff-their-highlight
 ;;   ,(tabak-face :foreground "gray"))

 `(magit-diff-whitespace-warning
   ,(tabak-face :foreground "background"
                :background "red"))
 `(magit-diffstat-added
   ,(tabak-face :foreground "green"))
 `(magit-diffstat-removed
   ,(tabak-face :foreground "red"))
 `(magit-dimmed
   ,(tabak-face :foreground "gray"))
 `(magit-filename
   ,(tabak-face :foreground "gray"))
 `(magit-hash
   ,(tabak-face :foreground "gray-d"))
 `(magit-head
   ,(tabak-face :foreground "gray"
                :weight 'bold))
 `(magit-header-line
   ,(tabak-face :foreground "yellow"
                :weight 'bold))
 `(magit-log-author
   ,(tabak-face :foreground "gray"
                :slant 'italic))
 `(magit-log-date
   ,(tabak-face :foreground "gray"))
 `(magit-log-graph
   ,(tabak-face :foreground "gray"))
 `(magit-popup-argument
   ,(tabak-face :foreground "yellow"))
 `(magit-popup-disabled-argument
   ,(tabak-face :foreground "gray-d"))
 `(magit-popup-heading
   ,(tabak-face :foreground "gray"
                :weight 'bold))
 `(magit-popup-key
   ,(tabak-face :foreground "brown"))
 `(magit-popup-option-value
   ,(tabak-face :foreground "gray"))
 `(magit-process-ng
   ,(tabak-face :foreground "red"))
 `(magit-process-ok
   ,(tabak-face :foreground "green"))
 `(magit-reflog-amend
   ,(tabak-face :foreground "green-d"))
 `(magit-reflog-checkout
   ,(tabak-face :foreground "blue"))
 `(magit-reflog-cherry-pick
   ,(tabak-face :foreground "red"))
 `(magit-reflog-commit
   ,(tabak-face :foreground "green"))
 `(magit-reflog-merge
   ,(tabak-face :foreground "brown"))
 `(magit-reflog-other
   ,(tabak-face :foreground "gray"))
 `(magit-reflog-rebase
   ,(tabak-face :foreground "brown"))
 `(magit-reflog-remote
   ,(tabak-face :foreground "violet"))
 `(magit-reflog-reset
   ,(tabak-face :foreground "yellow"))
 `(magit-refname
   ,(tabak-face :foreground "gray"))
 `(magit-refname-stash
   ,(tabak-face :foreground "gray"
                :slant 'italic
                :weight 'bold))
 `(magit-refname-wip
   ,(tabak-face :foreground "gray"
                :slant 'italic
                :weight 'bold))
 `(magit-section-heading
   ,(tabak-face :foreground "gray"
                :weight 'bold))
 `(magit-section-heading-selection
   ,(tabak-face :foreground "gray"))
 `(magit-section-highlight
   ,(tabak-face :background "background-l"))
 `(magit-section-secondary-heading
   ,(tabak-face :foreground "gray"))

 ;; `(magit-sequence-done
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-sequence-drop
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-sequence-head
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-sequence-onto
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-sequence-part
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-sequence-pick
 ;;   ,(tabak-face :foreground "gray"))

 ;; `(magit-sequence-stop
 ;;   ,(tabak-face :foreground "gray"))

 `(magit-signature-bad
   ,(tabak-face :foreground "red"))
 `(magit-signature-good
   ,(tabak-face :foreground "green"))
 `(magit-signature-untrusted
   ,(tabak-face :foreground "brown"))
 `(magit-tag
   ,(tabak-face :foreground "violet"
                :weight 'bold))

 ;; cider
 `(cider-debug-code-overlay-face
   ,(tabak-face :foreground "gray"))
 `(cider-docview-emphasis-face
   ,(tabak-face :foreground "gray" :slant 'italic))
 `(cider-docview-literal-face
   ,(tabak-face :foreground "gray" :weight 'bold))
 `(cider-docview-strong-face
   ,(tabak-face :foreground "gray"
                :weight 'bold
                :slant 'italic))
 `(cider-docview-table-border-face
   ,(tabak-face :foreground "brown"))
 `(cider-error-highlight-face
   ,(tabak-face :foreground "red-l"))
 `(cider-repl-err-output-face
   ,(tabak-face :foreground "red"))
 `(cider-repl-input-face
   ,(tabak-face :foreground "gray"))
 `(cider-repl-output-face
   ,(tabak-face :foreground "gray-l"))
 `(cider-repl-prompt-face
   ,(tabak-face :foreground "gray" :weight 'bold))
 `(cider-repl-result-face
   ,(tabak-face :foreground "gray"))
 `(cider-result-overlay-face
   ,(tabak-face :foreground "yellow"))
 `(cider-stacktrace-error-class-face
   ,(tabak-face :foreground "gray"))
 `(cider-stacktrace-error-message-face
   ,(tabak-face :foreground "red"))
 `(cider-stacktrace-face
   ,(tabak-face :foreground "gray" :background "background-d"))
 `(cider-stacktrace-filter-hidden-face
   ,(tabak-face :foreground "gray-d"))
 `(cider-stacktrace-filter-shown-face
   ,(tabak-face :foreground "gray-l"))
 `(cider-stacktrace-fn-face
   ,(tabak-face :foreground "yellow"))
 `(cider-stacktrace-ns-face
   ,(tabak-face :foreground "brown"))
 `(cider-test-error-face
   ,(tabak-face :foreground "red"))
 `(cider-test-failure-face
   ,(tabak-face :foreground "brown"))
 `(cider-test-success-face
   ,(tabak-face :foreground "green"))
 `(cider-warning-highlight-face
   ,(tabak-face :foreground "violet")))

;; --------------------
;; commands to enable the theme, and toggle the theme variants

(defun tabak-theme-dark ()
  "Enable tabak theme.  Set FRAME-BACKGROUND-MODE to dark."
  (interactive)
  (setq frame-background-mode 'dark)
  (mapc 'frame-set-background-mode (frame-list))
  (enable-theme 'tabak))

(defun tabak-theme-light ()
  "Enable tabak theme.  Set FRAME-BACKGROUND-MODE to light."
  (interactive)
  (setq frame-background-mode 'light)
  (mapc 'frame-set-background-mode (frame-list))
  (enable-theme 'tabak))

(defun tabak-toggle ()
  "Toggle the display property FRAME-BACKGROUND-MODE between dark and light."
  (interactive)
  (setq frame-background-mode
	(if (equal frame-background-mode 'dark)
	    'light
	  'dark))
  (mapc 'frame-set-background-mode (frame-list))
  (enable-theme 'tabak))


(provide-theme 'tabak)

;;; tabak-theme.el ends here
