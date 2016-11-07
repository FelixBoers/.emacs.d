;;; company-config.el -- Company-Mode configuration
										; -*-Emacs-Lisp-*-
;;; Commentary:
;;
;;; Code:
(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company '(add-to-list 'company-backends 'company-omnisharp))

(with-eval-after-load 'company
  (global-set-key (kbd "C-SPC") 'company-manual-begin))

(provide 'company-config)
;;; company-config.el ends here
