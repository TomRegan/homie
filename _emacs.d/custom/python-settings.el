;;; python.el --- Python specific settings

;;; Commentary:

;;; Code:

;;; this loads jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; this configures jedi-direx
(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

(provide 'python-settings)
;;; python.el ends here
