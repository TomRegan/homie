;;; custom-lisp.el --- Lisp settings

;;; Commentary:

;;; Code:

;;; configures the lisp environment
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "clisp")
(setq slime-default-lisp 'clisp)

(provide 'custom-lisp)
;;; custom-lisp ends here
