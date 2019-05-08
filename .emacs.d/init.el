
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (wanderlust web-mode groovy-mode magit-gitflow company-jedi company recentf-ext helm magit pandoc-mode pandoc w3m markdown-mode ddskk))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'tango-dark t)

(when (require 'skk nil t)
  (global-set-key (kbd "C-x j") 'skk-mode)
  (setq default-input-method "japanese-skk")
  (require 'skk-study))

(setq frame-title-format
      (format "%%b - %s-%s@%s"
	      invocation-name emacs-version system-name))
(tool-bar-mode 0)
(setq-default indent-tabs-mode nil)

;; ------------------------------------------------------------------------
;; @ fringe

;; バッファ中の行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil :height 0.8 :foreground "#19F870")
(setq linum-format "%4d ")


;; ------------------------------------------------------------------------
;; @ modeline
(line-number-mode t)
(column-number-mode t)

(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms '(24-hours ":" minutes))
(display-time-mode t)

;; ------------------------------------------------------------------------
;; @ cursor
(blink-cursor-mode 0)

;; 起動メッセージの非表示
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message -1)

;; ------------------------------------------------------------------------
;; @ backup

;; 変更ファイルのバックアップ
(setq make-backup-files t)

;; 変更ファイルの番号つきバックアップ
(setq version-control t)

;; バックアップディレクトリの変更
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))

;; 編集中ファイルのバックアップ
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; 編集中ファイルのバックアップ先
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; 編集中ファイルのバックアップ間隔（秒）
(setq auto-save-timeout 30)

;; 編集中ファイルのバックアップ間隔（打鍵）
(setq auto-save-interval 500)

;; バックアップ世代数
(setq kept-old-versions 1)
(setq kept-new-versions 2)

;; 上書き時の警告表示
;; (setq trim-versions-without-asking nil)

;; 古いバックアップファイルの削除
(setq delete-old-versions t)

;; ------------------------------------------------------------------------
;; @ Encoding
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(setq default-tab-width 4)

;; ------------------------------------------------------------------------
;; @ Current Line Highlight
(when (window-system)
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "color-24"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode t)
)
;; ------------------------------------------------------------------------
;; @ Misc
(setq truncate-partial-width-windows nil)
(show-paren-mode t)
(menu-bar-mode 0)

(setq suggest-key-bindings t)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key "\C-h" 'delete-backward-char)

(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(cua-mode t)
(setq cua-enable-cua-keys nil)

(setq vc-follow-symlinks t)

(require 'recentf)
(setq recentf-max-saved-items 2000)


(global-set-key "\C-xp" 'compile)
(add-hook 'compilation-finish-functions (lambda (buf strg) (prog1 (kill-buffer buf) (delete-other-windows))))

(setq twittering-use-master-password t)
(add-hook 'twittering-mode-init-hook
	  '(lambda () (linum-mode 0) (hl-line-mode 0)))

(windmove-default-keybindings 'meta)

;; ------------------------------------------------------------------------
;; @ Helm
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)


(helm-mode 1)

(require 'company)
(global-company-mode)
(setq company-idle-delay 0.5)
(setq company-selection-wrap-around t)
(global-set-key (kbd "C-M-i") 'company-complete)


(require 'jedi-core)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-to-list 'company-backends 'company-jedi)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(autoload 'word-count-mode "word-count" "Minor mode to count words."
  t nil)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?$"     . web-mode))
(setq web-mode-markup-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-css-indent-offset 4)

(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/site-lisp/")

(require 'vbnet-mode)
(add-to-list 'auto-mode-alist '("\\.vbs$" . vbnet-mode))
(add-to-list 'auto-mode-alist '("\\.hta$" . vbnet-mode))

