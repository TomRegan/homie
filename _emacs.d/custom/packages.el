;;; packages.el --- Required packages

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; install missing packages
(defvar packages
  '(ack-and-a-half
    ag
    auto-complete
    auto-complete-clang
    color-theme-solarized
    flx-ido
    flycheck
    flycheck-pyflakes
    git-commit-mode
    git-rebase-mode
    google-c-style
    google-this
    go-mode
    go-errcheck
    go-snippets
    helm
    helm-c-yasnippet
    ido-ubiquitous
    markdown-mode
    markdown-mode+
    magit
    projectile
    rainbow-delimiters
    rust-mode
    smartparens
    undo-tree
    yasnippet
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
;;; packages.el ends here
