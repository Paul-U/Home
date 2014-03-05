(require 'recentf)
(setq recentf-max-saved-items nil)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
