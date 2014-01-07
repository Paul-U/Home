(autoload 'anything-config "anything" nil t)
(eval-after-load "anything-config"
  '(progn
     (setq anything-c-filelist-file-name "/tmp/all.filelist")
     (setq anything-sources
	   '(anything-c-source-emacs-commands
	     anything-c-source-emacs-functions
	     anything-c-source-recentf
	     anything-c-source-buffers+
	     anything-c-source-files-in-current-dir+))
     ))
(setq anything-idle-delay 0.3)
(setq anything-input-idle-delay 0.4)
(setq anything-candidate-number-limit 35)

;; Copied from http://www.emacswiki.org/cgi-bin/wiki/AnythingSources#toc2
(defvar anything-c-imenu-delimiter "/")
(defvar anything-c-source-imenu
  '((name . "Imenu")
    (init . (lambda ()
              (setq anything-c-imenu-current-buffer
                    (current-buffer))))
    (candidates
     . (lambda ()
         (condition-case nil
             (with-current-buffer anything-c-imenu-current-buffer
               (mapcan
                (lambda (entry)
                  (if (listp (cdr entry))
                      (mapcar (lambda (sub)
                                (concat (car entry) anything-c-imenu-delimiter (car sub)))
                              (cdr entry))
                    (list (car entry))))
                (setq anything-c-imenu-alist (imenu--make-index-alist))))
           (error nil))))
    (volatile)
    (action
     . (lambda (entry)
         (let* ((pair (split-string entry anything-c-imenu-delimiter))
                (first (car pair))
                (second (cadr pair)))
           (imenu
            (if second
                (assoc second (cdr (assoc first anything-c-imenu-alist)))
              entry))
           )))))

(global-set-key (kbd "\C-xaa") 'anything)
(global-set-key (kbd "\C-xaf") 'anything-filelist+)
(global-set-key (kbd "\C-xax")
		  (lambda () (interactive)
		    (shell-command
		     "etags *.c *.h *.cpp *.hpp *.py *.el 2>/dev/null")
		    (anything-other-buffer
		     '(anything-c-source-imenu
		       anything-c-source-etags-select)
		     "anything find functions"
		     )))
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
