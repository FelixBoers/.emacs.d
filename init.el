;;; init.el --- My emacs init file
;;; Commentary:
;; Local Variables:
;; flycheck-disabled-checkers: emacs-lisp-checkdoc
;; End:
;;; Code:

;; Proxy
(if (equal system-name "CEWK1804")
	(setq url-proxy-services
		  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
			("http" . "cegate40:8080")
			("https" . "cegate40:8080"))))

;; Packages
(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmelade" . "http://marmelade-repo.org/packages/") t)

(package-initialize)
(package-refresh-contents)

;; Disable startup message
(setq inhibit-splash-screen t
    inhibit-startup-message t
    inhibit-startup-echo-area-message t)

;; Disable scroll/menu/tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show matching pairs of parentheses
(show-paren-mode 1)

;; Tabbing
(setq tab-width 4)
(setq-default tab-width 4)

;; Backup control
(setq backup-directory-alist `((".*" .,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(defun delete-backups-older-than-one-week()
  (message "Deleting old backup files...")
  (let ((week (* 60 60 24 7))
		(current (float-time (current-time))))
	(dolist (file (directory-files temporary-file-directory t))
	  (when (and (backup-file-name-p file)
				 (> (- current (float-time (nth 5 (file-attributes file))))
					week))
		(message "%s" file)
		(delete-file file)))))
(delete-backups-older-than-one-week)

;; Mics
(setq visible-bell 1)
(prefer-coding-system 'utf-8)
(set-frame-font "Consolas 12")

;; Theme
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))
(load-theme 'zenburn t)

;; Packages

;;; Org
(require 'org)
(setq org-hide-leading-stars t)
(setq org-log-done 'time)
(global-set-key (kbd "C-c a") 'org-agenda)

;;; Helm
(unless (package-installed-p 'helm)
  (package-install 'helm))

(require 'helm)
(helm-mode 1)
(setq helm-autoresize-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)

(unless (package-installed-p 'helm-projectile)
  (package-install 'helm-projectile))
(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "<f3>") 'helm-projectile-find-file)
(global-set-key [(shift f3)] 'helm-projectile-find-file-in-known-projects)

;;; Evil
(unless (package-installed-p 'evil)
    (package-install 'evil))
(setq evil-want-C-u-scroll t)
(require 'evil)

(defun evil-config()
  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/") 'evil-search-forward
    (kbd "n") 'evil-search-next
    (kbd "N") 'evil-search-previous
    (kbd "C-d") 'evil-scroll-down
    (kbd "C-u") 'evil-scroll-up))

(add-hook 'evil-mode-hook 'evil-config)
(evil-mode 1)

(unless (package-installed-p 'evil-leader)
    (package-install 'evil-leader))
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
  "j" 'ace-jump-mode)

;;; OmniSharp
(unless (package-installed-p 'omnisharp)
  (package-install 'omnisharp))
(require 'cl)
(require 'csharp-mode)
(require 'omnisharp)
;(add-hook 'csharp-mode-hook 'omnisharp-mode)

;;; Company
(unless (package-installed-p 'company)
  (package-install 'company))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company '(add-to-list 'company-backends 'company-omnisharp))
(global-set-key (kbd "C-SPC") 'company-manual-begin)

;; FlyCheck
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))
(require 'flycheck)
(global-flycheck-mode)
(setq flycheck-idle-change-delay 2) ; in seconds

;; Projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(require 'projectile)
(projectile-mode)
(setq projectile-use-native-indexing t)
(setq projectile-enable-caching t)

;; AceJump
(unless (package-installed-p 'ace-jump-mode)
  (package-install 'ace-jump-mode))


(provide 'init)

;;; init.el ends here

