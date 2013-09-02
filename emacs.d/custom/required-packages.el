;;; required-packages.el --- required packages

(require 'cl)
(require 'package)
(add-to-list 'package-archives ;; augment packages with MELPA repository
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; install missing packages
(defvar required-packages
  '(busybee-theme
    git-commit-mode
    git-rebase-mode
    google-c-style
    ido-ubiquitous
    magit
    markdown-mode
    markdown-mode+
    rainbow-mode
    undo-tree
))

(defun required-packages-installed-p ()
  (every #'package-installed-p required-packages))

(defun install-required-package (package)
  (unless (package-installed-p package)
    (package-install package)))

(defun install-required-packages (packages)
  (mapc #'install-required-package packages))

(defun install-packages ()
  (unless (required-packages-installed-p)
    (package-refresh-contents)
    (install-required-packages required-packages)))

(install-packages)

(provide 'required-packages)
