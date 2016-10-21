(setq evil-want-C-u-scroll t)

(require 'evil)

;;; https://github.com/noctuid/evil-guide#keybindings-and-state
(defun evil-config()
  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/") 'evil-search-forward
    (kbd "n") 'evil-search-next
    (kbd "N") 'evil-search-previous
    (kbd "C-d") 'evil-scroll-down
    (kbd "C-u") 'evil-scroll-up))

(add-hook 'evil-mode-hook 'evil-config)
(evil-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
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

(provide 'evil-config)