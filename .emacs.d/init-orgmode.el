;;
;; Org-mode Settings
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/org-mode/lisp/")

;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

;; TODO状態
(setq org-todo-keywords 
      '((sequence "TODO(t)" "WAIT(w)"  "|" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)

;; LaTeX Export Settings
(setq org-export-latex-coding-system 'utf-8)
(setq org-export-latex-date-format "%Y-%m-%d")
(setq org-export-latex-classes nil)
(add-to-list 'org-export-latex-classes
  '("jsarticle"
    "\\documentclass[a4j]{jsarticle}"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))
;; アジェンダ表示の対象ファイル
(setq org-agenda-files (list org-directory))
;; アジェンダ表示で下線を用いる
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
(setq hl-line-face 'underline)
;; 標準の祝日を利用しない
(setq calendar-holidays nil)


(require 'org-capture)
(require 'org-install)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline nil "Tasks")
         "** TODO %?\n   %i\n   %a\n   %t")
        ("f" "Fix" entry
         (file+headline nil "Tasks")
         "** TODO %?   :fix:\n   %i\n   %a\n   %t")
	("n" "Note" entry
	 (file+headline nil "Note")
	 "** Note %?\n   :fix:\n   %i\n   %a\n   %t")
        ("i" "Idea" entry
         (file+headline nil "New Ideas")
         "** %?\n   %i\n   %a\n   %t")))
(global-set-key (kbd "C-c c") 'org-capture)
