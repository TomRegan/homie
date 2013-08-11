;;; Code

(message "Configuring CEDET")

(semantic-load-enable-gaudy-code-helpers)
(semantic-mode 1)

;;; auto-completion
;;; trigger completion on '.' and '->'
(defun my-c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;;; cedet.el ends here
