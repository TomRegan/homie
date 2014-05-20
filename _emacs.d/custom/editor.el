;;; editor --- Gui settings

;;; Commentary:

;;; Code:

;; yasnippet
(yas-global-mode 1)

;; autocomplete
(defun ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))
)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(global-auto-complete-mode 1)

;; helm
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; projectile
(setq projectile-indexing-method 'git
      projectile-enable-caching t)
(projectile-global-mode t)

;; uniquify
(require 'uniquify)

;; theming
(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes/solarized")
(load-theme 'zenburn t)
(menu-bar-mode -1)  ;; disable menu bar

;; flyspell
(add-hook 'c++-mode-hook
  (lambda ()
    (flyspell-prog-mode)
))

;; ido
(ido-mode t)             ;; enable ido
(ido-ubiquitous-mode t)  ;; for all of the things

;; undo tree
(global-undo-tree-mode)

;; parens pairing
(autopair-global-mode 1)

;; yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; whitespace highlighting
(require 'whitespace)
(setq whitespace-style '(
			 face
			 empty
			 trailing
			 lines-tail
			 space-before-tab
			 ))
(global-whitespace-mode 1)

;; ag
;;(global-set-key (kbd "C-c C-s") 'ag)
;;(setq ag-highlight-search t)

(provide 'editor)
;;; editor.el ends here
