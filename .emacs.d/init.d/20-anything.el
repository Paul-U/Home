(require 'anything)
(require 'anything-config)
(require 'anything-startup)
(setq anything-c-filelist-file-name "/tmp/all.filelist")
 (setq anything-sources
       '(anything-c-source-emacs-commands
 	anything-c-source-emacs-functions
 	anything-c-source-recentf
 	anything-c-source-buffers+
 	anything-c-source-files-in-current-dir+))

(setq anything-idle-delay 0.3)
(setq anything-input-idle-delay 0.4)
(setq anything-candidate-number-limit 35)

(global-set-key (kbd "\C-xaa") 'anything)
(global-set-key (kbd "\C-xaf") 'anything-filelist+)
