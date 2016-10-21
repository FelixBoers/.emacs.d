(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company '(add-to-list 'company-backends 'company-omnisharp))
(global-set-key (kbd "C-SPC") 'company-manual-begin)

(provide 'company-config)