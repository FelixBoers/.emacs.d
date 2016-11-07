(setq evil-want-C-u-scroll t)

(require 'evil)
(require 'evil-leader)
(require 'org-evil)

(defun occur-last-search()
  "Run `occur` with the last evil search serm."
  (interactive)
  (let ((term (if evil-regexp-search
				  (car-safe regexp-search-ring)
				(car-safe search-ring))))
	(if (> (length term) 0)
		(occur term)
	  (message "No term to search for."))))

(defun org-custom-agenda()
  (interactive)
  (org-agenda nil "c"))

(global-evil-leader-mode)
(evil-mode 1)

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
  "q" 'kill-buffer-and-window
  "e" 'find-file
  "aa" 'align-regexp
  "a" 'org-custom-agenda
  "g" 'magit-status)

(define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "M-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "M-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "M-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "-") 'helm-find-files)
(define-key evil-normal-state-map (kbd "g/") 'occur-last-search)
(define-key evil-normal-state-map (kbd "gf") 'ace-jump-mode)

(evil-define-key 'normal global-map (kbd "C-p") 'helm-projectile)
(evil-define-key 'normal global-map (kbd "C-S-p") 'helm-projectile-switch-project)

;; Make escape quit everything, whenever possible.
(defun minibuffer-keyboard-quit()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
	  (setq deactivate-mark t)
	(when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
	(abort-recursive-edit)))
		   
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Dired
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

;; NeoTree
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(provide 'evil-config)
