;; location of themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/busybee")
;; load whichever theme currently tickes me
(load-theme 'busybee t)
;; enable spell-checking
(flyspell-mode 1)
;; augment packages with MELPA repository
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9562e9eb5fd01677ac6b76b66f9a81338991fa9d270270802eeae5232c8da0a6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
