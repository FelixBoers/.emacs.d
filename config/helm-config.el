(require 'helm)
(helm-mode 1)
(setq helm-autoresize-mode t)

(require 'helm-projectile)
(helm-projectile-on)

(provide 'helm-config)