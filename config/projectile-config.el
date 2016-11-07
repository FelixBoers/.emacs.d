;;; projectile-config.el -- Projectile configuration
; -*-Emacs-Lisp-*-
;;; Commentary:
;; 
;;; Code:
(require 'projectile)
(projectile-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(provide 'projectile-config)
;;; projectile-config.el ends here
