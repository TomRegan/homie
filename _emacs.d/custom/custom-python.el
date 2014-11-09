;;; python.el --- Python specific settings

;;; Commentary:

;;; Code:

;;; this loads jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'custom-python)
;;; python.el ends here
