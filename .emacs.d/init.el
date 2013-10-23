; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

   (setq frame-title-format "%b")

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
   (add-to-list 'load-path "~/.emacs.d/elpa/color-theme-20080305.834/")
   (require 'color-theme)
   (color-theme-initialize)
   (color-theme-simple-1)

;; ------------------------------------------------------------------------
;; @ package manager
   (require 'package)
   (add-to-list 'package-archives
                '("melpa" . "http://melpa.milkbox.net/packages/") t)
   (add-to-list 'package-archives
                '("marmalade" . "http://marmalade-repo.org/packages/"))
   (package-initialize)


   (set-keyboard-coding-system 'utf-8)
   (set-terminal-coding-system 'utf-8)


;;
;; Written by Hiro
;;

;; ドキュメントフォルダ
(let ( (s (getenv "DOCUMENTS")) )
  (when s (cd
	   (if (equal (getenv "CYGWIN") nil)
	       s
	     (substring (shell-command-to-string
		(concat "cygpath -u " s)) 0 -1
	       )))
      ))

;; Cygwin Terminalを起動
(defun mintty () (interactive) (call-process "/bin/mintty.exe" nil 0 nil "/bin/bash"))
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(setq truncate-partial-width-windows nil)
(show-paren-mode t)

(add-to-list 'load-path user-emacs-directory)
(load-library "init-yatex")
(load-library "init-orgmode")
(setq suggest-key-bindings t)
(fset 'yes-or-no-p 'y-or-n-p)

;; ミニバッファ履歴リストの最大長：tなら無限
(setq history-length t)
;; session.el
;;   kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-save-file  (concat "~/.emacs.d/.session." (system-name)))
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)
				 ))
  (add-hook 'after-init-hook 'session-initialize)
  ;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))

;; minibuf-isearch
;;   minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)

(load-library "csv-mode-1.2")
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(setq skk-sticky-key ";")
(setq skk-show-inline 'vertical)
(setq skk-kutouten-type 'jp-en)
