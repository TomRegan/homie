;;; packages.el --- required packages

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; install missing packages
(defvar packages
  '(ag
    autopair
    busybee-theme
    color-theme-solarized
    flx-ido
    git-commit-mode
    git-rebase-mode
    google-c-style
    go-mode
    ido-ubiquitous
    markdown-mode
    markdown-mode+
    projectile
    rainbow-mode
    rust-mode
    undo-tree
    zenburn-theme
))

(defun packages-installed-p (packages)
  (if (not packages)
      t
    (if (package-installed-p (car packages)) 
	(packages-installed-p (cdr packages))
      nil)))

(defun install-packages (packages)
  (mapc 'install-package packages))

(defun install-package (package)
  (unless (package-installed-p package)
    (package-install package)))

(defun install-missing-packages ()
  (unless (packages-installed-p packages)
    (package-refresh-contents)
    (install-packages packages)))

(install-missing-packages)

(provide 'packages)
