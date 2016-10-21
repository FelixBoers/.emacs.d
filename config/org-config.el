(require 'org)

(setq org-hide-leading-stars t)
(setq org-log-done 'time)
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'org-config)