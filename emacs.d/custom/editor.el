;;; editor.el --- editor settings

;; theming
(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes/solarized")
(load-theme 'solarized-dark t)
(menu-bar-mode -1)  ;; disable menu bar

;; flyspell
(flyspell-mode 1) ;; FIXME not working

;; ido
(ido-mode t)        ;; enable ido
(ido-ubiquitous t)  ;; for all of the things

;; undo tree
(global-undo-tree-mode)

;; parens pairing
(autopair-global-mode 1)

;; yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; whitespace highlighting
(require 'whitespace)
(setq whitespace-style '(face tabs empty trailing lines-tail))
(global-whitespace-mode 1)

;; ag
(global-set-key (kbd "C-c C-s") 'ag)
(setq ag-highlight-search t)

(provide 'editor)
