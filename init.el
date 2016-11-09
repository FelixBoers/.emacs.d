;;; init.el -- My emacs configuration
										;-*-Emacs-Lisp-*-
;;; Commentary:
;;
;;; Code:

(require 'url-vars)

(if (equal system-name "CEWK1804")
	(setq url-proxy-services
	  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
		("http" . "cegate40:8080")
		("https" . "cegate40:8080"))))

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
  zenburn-theme			; one of the best low contract color themes
  jazz-theme

  ace-jump-mode			; Enables fast/direct cursor movement in current view
  company				; Modular in-buffer bompletion framework
  diminish				; don't clutter the modeline with minor mode names
  omnisharp				; Troll coworkers - use Emacs at work for csharp
  evil					; evil is an (e)xtensive (v)(i) (l)ayer for emacs	.	It provides Vim features.
  evil-leader			; port of vim's mapleader
  evil-nerd-commenter	; helps to comment code efficently
  evil-surround			; you will be surrounded (surround.vim for evil)
  org-evil				; evil extension for org mode
  flycheck				; On the fly syntax checking
  git-gutter			; Show an icon in the gutter area indicating whether a line has been inserted, modified or deleted.
  helm					; incremental completion and selection narrowing framework
  helm-projectile		; helm ui for projectile
  linum-relative		; display relative line number in the left margin
  magit					; a git porcelain inside emacs
  markdown-mode
  neotree				; a emacs plugin like NerdTree for Vim
  popwin				; Popup window manager
  projectile			; Project Integration Library
  rainbow-delimiters	; Highlighting delimiters in different colors according to their depth
  scss-mode
  smooth-scrolling		; avoids jumping to to middle of the page
  yaml-mode
  yasnippet				; A template system
  ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'basic-config)
(require 'evil-config)
(require 'org-config)
(require 'popwin-config)
(require 'helm-config)
(require 'omnisharp-config)
(require 'msbuild-config)
(require 'company-config)
(require 'flycheck-config)
(require 'projectile-config)
(require 'yasnippet-config)
(require 'dired-config)
(require 'neotree-config)
(require 'magit-config)

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
    '(diminish 'undo-tree-mode))
  (eval-after-load "git-gutter"
	'(diminish 'git-gutter-mode)))
;;; init.el ends here
