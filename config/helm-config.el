(require 'helm)
(helm-mode 1)
(setq helm-autoresize-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "<f3>") 'helm-projectile-find-file)
(global-set-key [(shift f3)] 'helm-projectile-find-file-in-known-projects)

(provide 'helm-config)