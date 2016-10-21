;; Copmany
(with-eval-after-load 'company
  (global-set-key (kbd "C-SPC") 'company-manual-begin))

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "<f3>") 'helm-projectile-find-file)
(global-set-key [(shift f3)] 'helm-projectile-find-file-in-known-projects)

;; Org
(global-set-key (kbd "C-c a") 'org-agenda)

;; Evil
(add-hook 'evil-mode-hook
  (lambda()
    (evil-add-hjkl-bindings occur-mode-map 'emacs
      (kbd "/") 'evil-search-forward
      (kbd "n") 'evil-search-next
      (kbd "N") 'evil-search-previous
      (kbd "C-d") 'evil-scroll-down
      (kbd "C-u") 'evil-scroll-up)))

(evil-leader/set-leader ",")
(evil-leader/set-key
  ":" 'eval-expression
  "b" 'helm-mini
  "d" 'kill-this-buffer
  "o" 'delete-other-windows
  "w" 'save-buffer
  "x" 'helm-M-x
  "y" 'yank-to-x-clipboard
  "f" 'ace-jump-mode)

(provide 'keybindings)