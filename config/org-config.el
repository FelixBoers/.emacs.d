(require 'org)

(setq org-hide-leading-stars t)
(setq org-log-done 'time)

(eval-after-load 'org
  '(progn
	 (defun wicked/org-clock-in-if-starting()
	   "Clock in when the task is marked STARTED."
	   (when (and (string= state "STARTED")
				  (not (string= last-state state)))
		 (org-clock-in)))
	 (add-hook 'org-after-todo-state-change-hook
			   'wicked/org-clock-in-if-starting)
	 (defadvice org-clock-in (after wicked activate)
	   "Set this task's status to 'STARTED'."
	   (org-todo "STARTED"))
	 (defun wicked/org-clock-out-if-waiting()
	   "Clock out when the task is marked WAITING"
	   (when (and (string= state "WAITING")
				  (equal (marker-buffer org-clock-marker) (current-buffer))
				  (< (point) org-clock-marker)
				  (> (save-excursion (outline-next-heading) (point))
					 (org-clock-marker))
				  (not (string= last-state state)))
		 (org-clock-out)))
	 (add-hook 'org-after-todo-state-change-hook
			   'wicked/org-clock-out-if-waiting)))

(provide 'org-config)
