(require 'org)

(setq org-hide-leading-stars t)
(setq org-log-done 'time)

(add-to-list 'org-modules "org-habit")

;;; (eval-after-load 'org
;;;   '(progn
;;; 	 (defun wicked/org-clock-in-if-starting()
;;; 	   "Clock in when the task is marked STARTED."
;;; 	   (when (and (string= state "STARTED")
;;; 				  (not (string= last-state state)))
;;; 		 (org-clock-in)))
;;; 	 (add-hook 'org-after-todo-state-change-hook
;;; 			   'wicked/org-clock-in-if-starting)
;;; 	 (defadvice org-clock-in (after wicked activate)
;;; 	   "Set this task's status to 'STARTED'."
;;; 	   (org-todo "STARTED"))
;;; 	 (defun wicked/org-clock-out-if-waiting()
;;; 	   "Clock out when the task is marked WAITING"
;;; 	   (when (and (string= state "WAITING")
;;; 				  (equal (marker-buffer org-clock-marker) (current-buffer))
;;; 				  (< (point) org-clock-marker)
;;; 				  (> (save-excursion (outline-next-heading) (point))
;;; 					 (org-clock-marker))
;;; 				  (not (string= last-state state)))
;;; 		 (org-clock-out)))
;;; 	 (add-hook 'org-after-todo-state-change-hook
;;; 			   'wicked/org-clock-out-if-waiting)))

(defun org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.
PRIORITY may be one o fthe charaters ?A, ?B or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
		(pri-value (* 1000 (- org-lowest-priority priority)))
		(pri-current (org-get-priority (thing-at-point 'line t))))
	(if (= pri-value pri-current)
		subtree-end
	  nil)))

(setq org-agenda-custom-commands
	  '(("c" "Simple agenda view"
		 ((tags "PRIORITY=\"A\""
				((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
				 (org-agenda-overriding-header "High-priority unfinished tasks:")))
		  (agenda "")
		  (alltodo ""
				   ((org-agenda-skip-function
					 '(or (org-skip-subtree-if-priority ?A)
						  (org-agenda-skip-if nil '(scheduled deadline))))))))))

(provide 'org-config)
