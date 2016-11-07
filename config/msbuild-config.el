;;; msbuild-config.el -- MsBuild configuration
; -*-Emacs-Lisp-*-
;;; Commentary:
;; 
;;; Code:
(defun get-sln-path()
  (let ((location nil))
	(dolist (dir (expand-directory default-directory))
	  (setq location (directory-files dir nil ".gitignore"))
	  (when (not location)
		(location)))
	location))

(defun expand-directory(dir)
  (let ((previous nil) (current) (result))
	(dolist (part (split-string dir "/"))
	  (if previous
		  (setq current (concat previous (file-name-as-directory part)))
		(setq current (concat (file-name-as-directory part))))
	  (setq result (cons current result))
	  (setq previous current))
	result))

(provide 'msbuild-config)
;;; msbuild-config.el ends here
