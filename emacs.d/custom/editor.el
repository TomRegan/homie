;;; editor.el --- editor settings

;; theming
(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes/busybee")
(load-theme 'busybee t)
(menu-bar-mode -1)  ;; disable menu bar

;; flyspell
(flyspell-mode 1) ;; FIXME not working

;; ido
(ido-mode t)        ;; enable ido
(ido-ubiquitous t)  ;; for all of the things

;; undo tree
(global-undo-tree-mode)

;; parens pairing
(electric-pair-mode t)

;; whitespace highlighting
(require 'whitespace)
(setq whitespace-style '(face tabs empty trailing lines-tail))
(global-whitespace-mode 1)

(provide 'editor)
