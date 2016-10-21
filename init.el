(if (equal system-name "CEWK1804")
	(setq url-proxy-services
		  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
			("http" . "cegate40:8080")
			("https" . "cegate40:8080"))))

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
    zenburn-theme		; one of the best low contract color themes

    diminish			; don't clutter the modeline with minor mode names
    smooth-scrolling	; avoids jumping to to middle of the page
    helm				; incremental completion and selection narrowing framework
    helm-projectile		; helm ui for projectile
    evil				; evil is an (e)xtensive (v)(i) (l)ayer for emacs	.	It provides Vim features.
    evil-leader			; port of vim's mapleader
	org-evil			; evil extension for org mode
    omnisharp			; Troll coworkers - use Emacs at work for csharp
    flycheck			; On the fly syntax checking 
    company				; Modular in-buffer bompletion framework 
    projectile			; Project Integration Library
    yasnippet			; A template system 
    ace-jump-mode		; Enables fast/direct cursor movement in current view
	popwin				; Popup window manager
	neotree				; a emacs plugin like NerdTree for Vim
  ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/config/")

(require 'basic-config)
(require 'ui-config)
(require 'org-config)
(require 'popwin-config)
(require 'helm-config)
(require 'evil-config)
(require 'omnisharp-config)
(require 'msbuild-config)
(require 'company-config)
(require 'flycheck-config)
(require 'projectile-config)
(require 'yasnippet-config)
(require 'dired-config)
(require 'neotree-config)
(require 'keybindings)

;; Diminish modes so they don't show up in the modeline
(require 'diminish)
(when (require 'diminish nil 'noerror)
  (eval-after-load "company"
    '(diminish 'company-mode))
  (eval-after-load "yasnippet"
    '(diminish 'yas-minor-mode))
  (eval-after-load "helm"
    '(diminish 'helm-mode))
  (eval-after-load "projectile"
    '(diminish 'projectile-mode))
  (eval-after-load "undo-tree"
    '(diminish 'undo-tree-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/.emacs.d/init.org"))))
