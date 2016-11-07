;;; dired-config.el -- Dired-Mode configuration
										; -*-Emacs-Lisp-*-
;;; Commentary:
;;
;;; Code:
(require 'dired)
(require 'dired-x)

(defun my-dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file."
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
    ))

(provide 'dired-config)
;;; dired-config.el ends here
