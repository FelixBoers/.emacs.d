(require 'helm)


(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(setq helm-autoresize-mode 1)
(helm-mode 1)

(require 'helm-projectile)
(helm-projectile-on)

(provide 'helm-config)
