;;; basic-config.el -- Basic configurations
										;-*-Emacs-Lisp-*-
;;; Commentary:
;;
;;; Code:

;; Font
(require 'frame)
(set-frame-font "DejaVu Sans Mono 11")

;; Disable scroll/menu/tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Match delimiters such as brackets parentheses or braces
(show-paren-mode 0)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Git-Gutter
(global-git-gutter-mode +1)

;; Yaml Mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; Scss Mode
(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; Basic keybindings
(define-key global-map (kbd "C-c u") 'insert-char) ;; "u" for Unicode

;; Disable startup message
(setq inhibit-splash-screen t
    inhibit-startup-message t
    inhibit-startup-echo-area-message t)

(require 'linum)
(global-linum-mode)

;; Tabbing
(setq tab-width 4)
(setq-default tab-width 4)

;; Scrolling
(smooth-scrolling-mode)
(setq smooth-scroll-margin 5)

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
(setq visible-bell nil)
(setq ring-bell-function
	  '(lambda()
		 (invert-face 'mode-line)
		 (run-with-timer 0.1 nil 'invert-face 'mode-line)))
(prefer-coding-system 'utf-8)

;; Shell
(require 'shell)
(if (equal system-type "windows-nt")
  (setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
  (setq shell-file-name "C:/Program Files/Git/bin/bash.exe")
  (defvar explicit-bash.exe-args '("--noediting" "--login" "-i"))
  (add-to-list 'exec-path "C:/Program Files/Git/bin")
  (setenv "SHELL" shell-file-name)
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m))
  (unless (package-installed-p 'powershell)
    (package-install 'powershell))

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; Jumping
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump bacl :-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(load-theme 'jazz t)

(provide 'basic-config)
;;; basic-config.el ends here
