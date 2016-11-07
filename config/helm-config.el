;;; helm-config.el -- Helm-Mode configuration
; -*-Emacs-Lisp-*-
;;; Commentary:
;; 
;;; Code:
(require 'helm)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(setq helm-autoresize-mode 1)
(setq helm-split-window-in-side-p t)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)

(require 'helm-projectile)
(helm-projectile-on)

(provide 'helm-config)
;;; helm-config.el ends here
