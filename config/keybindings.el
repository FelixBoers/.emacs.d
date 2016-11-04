;; Copmany
(with-eval-after-load 'company
  (global-set-key (kbd "C-SPC") 'company-manual-begin))

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)

;; Org
(global-set-key (kbd "C-c a") 'org-agenda)

;; Evil

(provide 'keybindings)
