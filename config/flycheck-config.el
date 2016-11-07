;;; flycheck-config.el -- Flycheck-Mode configuration
										; -*-Emacs-Lisp-*-
;;; Commentary:
;;
;;; Code:
(require 'flycheck)
(global-flycheck-mode)
(setq flycheck-idle-change-delay 2) ; in seconds

(provide 'flycheck-config)
;;; flycheck-config.el ends here
