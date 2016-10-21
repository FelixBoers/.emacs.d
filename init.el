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
    zenburn-theme

    diminish ; don't clutter the modeline with minor mode names
    smooth-scrolling ; avoids jumping to to middle of the page
    helm
    helm-projectile
    evil
    evil-leader
    omnisharp
    flycheck
    company
    projectile
    yasnippet
    ace-jump-mode
  ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/config/")

(require 'basic-config)
(require 'ui-config)
(require 'org-config)
(require 'helm-config)
(require 'evil-config)
(require 'omnisharp-config)
(require 'company-config)
(require 'flycheck-config)
(require 'projectile-config)
(require 'yasnippet-config)
(require 'keybindings)

;; Diminish modes so they don't show up in the modeline
(require 'diminish)
(when (require 'diminish nil 'noerror)
  (eval-after-load "company"
    '(diminish 'company-mode))
  (eval-after-load "yasnippet"
    '(diminish 'yas-minor-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/.emacs.d/init.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
