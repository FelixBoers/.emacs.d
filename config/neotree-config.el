;;; neotree-config.el -- NeoTree configuration
; -*-Emacs-Lisp-*-
;;; Commentary:
;; 
;;; Code:
(require 'neotree)

;(setq neo-smart-open t)
;(setq neo-theme (if window-system 'icons 'arrow))
;(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key [f8] 'neotree-toggle)

(provide 'neotree-config)
;;; neotree-config.el ends here
