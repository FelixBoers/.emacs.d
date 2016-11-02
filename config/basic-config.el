;; Disable startup message
(setq inhibit-splash-screen t
    inhibit-startup-message t
    inhibit-startup-echo-area-message t)

;; Tabbing
(setq tab-width 4)
(setq-default tab-width 4)

;; Scrolling
(smooth-scrolling-mode)
(setq smooth-scroll-margin 5)

;; Auto reload file
(global-auto-revert-mode)

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

;; Shell
(if (equal system-type "windows-nit")
  (setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
  (setq shell-file-name "C:/Program Files/Git/bin/bash.exe")
  (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
  (add-to-list 'exec-path "C:/Program Files/Git/bin")
  (setenv "SHELL" shell-file-name)
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m))
  (unless (package-installed-p 'powershell)
    (package-install 'powershell))

; ;; Makes *scratch* empty.
; (setq initial-scratch-message "")
; 
; ;; Removes *scratch* from buffer after the mode has been set.
; (defun remove-scratch-buffer ()
;   (if (get-buffer "*scratch*")
;       (kill-buffer "*scratch*")))
; (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
; 
; ;; Removes *messages* from the buffer.
; (setq-default message-log-max nil)
; (kill-buffer "*Messages*")
; 
; ;; Removes *Completions* from buffer after you've opened a file.
; (add-hook 'minibuffer-exit-hook
;       '(lambda ()
;          (let ((buffer "*Completions*"))
;            (and (get-buffer buffer)
;                 (kill-buffer buffer)))))
; 
; ;; Don't show *Buffer list* when opening multiple files at the same time.
; (setq inhibit-startup-buffer-menu t)
; 
; ;; Show only one active window when opening multiple files at the same time.
; (add-hook 'window-setup-hook 'delete-other-windows)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'basic-config)
