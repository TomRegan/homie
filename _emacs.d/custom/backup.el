;;; backup.el --- Configuration for temp files.

;;; Commentary:

;;; Code:

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(setq make-backup-files t        ; backup of a file the first time it is saved.
      backup-by-copying t        ; don't clobber symlinks
      version-control t          ; version numbers for backup files
      delete-old-versions t      ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6        ; oldest versions to keep when a new numbered
                                 ; backup is made (default: 2)
      kept-new-versions 9        ; newest versions to keep when a new numbered
                                 ; backup is made (default: 2)
      auto-save-default t        ; auto-save every buffer that visits a file
      auto-save-timeout 20       ; number of seconds idle time before auto-save
                                 ; (default: 30)
      auto-save-interval 200     ; number of keystrokes between auto-saves
                                 ; (default: 300)
      )

;;; this will delete backups older than one week
(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

(provide 'backup)
;;; backup.el ends here
