;;; custom-lisp.el --- Lisp settings

;;; Commentary:

;;; Code:

;;; configures the lisp environment
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/clisp")

(provide 'lisp-settings)
;;; custom-lisp ends here
