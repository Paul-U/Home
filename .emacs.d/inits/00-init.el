(setq frame-title-format "%b")
(tool-bar-mode 0)

;; ------------------------------------------------------------------------
;; @ fringe

;; バッファ中の行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil :height 0.8)
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
;; @ color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-simple-1)

;; ------------------------------------------------------------------------
;; @ Encoding
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;; ------------------------------------------------------------------------
;; @ Font

;; abcdefghijklmnopqrstuvwxyz 
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; `1234567890-=\[];',./
;; ~!@#$%^&*()_+|{}:"<>?
;;
;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;; 123456789012345678901234567890123456789012345678901234567890
;; ABCdeＡＢＣｄｅ
;;
;; ┌─────────────────────────────┐
;; │　　　　　　　　　　　　　罫線                            │
;; └─────────────────────────────┘

(when window-system
  (set-face-attribute 'default nil
		      :family "Migu 1M"
		      :height 120
		      :foundry "outline"
		      )
  (set-fontset-font nil
		    'japanese-jisx0208
		    (font-spec :family "Meiryo"))
  (setq face-font-rescale-alist '(("Meiryo" . 1.00)))   
  )

;; ------------------------------------------------------------------------
;; @ Misc
(setq truncate-partial-width-windows nil)
(show-paren-mode t)

(setq suggest-key-bindings t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq completion-ignore-case t)
