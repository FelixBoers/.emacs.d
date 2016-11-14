;;; omnisharp-config.el -- OmniSharp configuration
; -*-Emacs-Lisp-*-
;;; Commentary:
;; 
;;; Code:
(eval-when-compile (require 'cl))
(require 'csharp-mode)
(require 'omnisharp)
;(add-hook 'csharp-mode-hook 'omnisharp-mode)

(add-hook 'csharp-mode-hook
		  (lambda ()
			(set (make-local-variable 'compile-command) "MsBuild.exe")))
			;;; (flymake-mode)))

(provide 'omnisharp-config)
;;; omnisharp-config.el ends here
