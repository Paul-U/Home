
(setq frame-title-format
      (format "%%b - %s-%s@%s"
	      invocation-name emacs-version system-name))
(tool-bar-mode 0)

;; ------------------------------------------------------------------------
;; @ fringe

;; バッファ中の行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil :height 0.8 :foreground "#19F870")
(setq linum-format "%4d")


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


;; ------------------------------------------------------------------------
;; @ Current Line Highlight
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

(require 'undo-tree)
(global-undo-tree-mode)

(cua-mode t)
(setq cua-enable-cua-keys nil)

(setq vc-follow-symlinks t)

(require 'recentf)

(global-set-key "\C-xp" 'compile)

(setq twittering-use-master-password t)

