;;; init.el --- configureation for emacs

;; required packages
(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/syntax")
(require 'packages)
(require 'editor)
(require 'backup)
(require 'cmake-mode)

;; automatically configured shizzle
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#262626" "#d70000" "#5f8700" "#af8700" "#0087ff" "#af005f" "#00afaf" "#626262"])
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "9562e9eb5fd01677ac6b76b66f9a81338991fa9d270270802eeae5232c8da0a6" default)))
 '(foreground-color "#808080")
 '(safe-local-variable-values (quote ((eval c-set-offset (quote class-close) 2) (eval c-set-offset (quote class-open) 2) (eval c-set-offset (quote access-label) 0) (eval c-set-offset (quote substatement-open) 2) (eval c-set-offset (quote case-label) 0) (require-final-newline . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
