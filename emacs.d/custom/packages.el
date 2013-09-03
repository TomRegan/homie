;;; packages.el --- required packages

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; install missing packages
(defvar packages
  '(busybee-theme
    git-commit-mode
    git-rebase-mode
    google-c-style
    ido-ubiquitous
    markdown-mode
    markdown-mode+
    rainbow-mode
    undo-tree
))

(defun installed-p (package)
  (package-installed-p package))
  
(defun packages-installed-p (packages)
  (if packages
      (if (installed-p (car packages)) 
	  (packages-installed-p (cdr packages))
	nil)
    t))

(defun install-package (package)
  (unless (package-installed-p package)
    (package-install package)))

(defun install-packages (packages)
  (mapc 'install-package packages))

(defun install-missing-packages ()
  (unless (packages-installed-p packages)
    (package-refresh-contents)
    (install-packages packages)))

(install-missing-packages)

(provide 'packages)
