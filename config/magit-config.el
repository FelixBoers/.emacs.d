(require 'magit)

(eval-after-load 'magit
  '(progn
	 (require 'evil)
	 (evil-set-initial-state 'magit-log-edit-mode 'insert)
	 (evil-set-initial-state 'git-commit-mode 'insert)))

(add-hook 'git-commit-mode-hook 'evil-insert-state)

(provide 'magit-config)
