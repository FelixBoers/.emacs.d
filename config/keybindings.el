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
  "f" 'ace-jump-mode
  "q" 'kill-buffer-and-window
  "e" 'find-file)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;;; Dired
(evil-define-key 'normal dired-mode-map "h" 'my-dired-up-directory)
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternative-file)
(evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
(evil-define-key 'normal dired-mode-map "v" 'dired-toggle-mask)
(evil-define-key 'normal dired-mode-map "m" 'dired-mark)
(evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
(evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
(evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)
(evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
(evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)

;;; NeoTree
(global-set-key [f8] 'neotree-toggle)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(provide 'keybindings)
