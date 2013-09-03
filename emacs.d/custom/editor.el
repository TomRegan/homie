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

(provide 'editor)
