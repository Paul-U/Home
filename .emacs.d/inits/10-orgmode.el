;;
;; Org-mode Settings
;;

(require 'org-install)

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
(require 'ox-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(setq org-latex-coding-system 'utf-8)
(setq org-latex-date-format "%Y-%m-%d")
(setq org-latex-classes nil)
(add-to-list 'org-latex-classes
  '("jsarticle"
    "\\documentclass[a4j]{jsarticle}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{url}
\\usepackage{amsmath}
\\usepackage[dvipdfmx,setpagesize=false]{hyperref}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
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
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline nil "Tasks")
         "** TODO %?\n   %i\n   %a\n   %T")
        ("f" "Fix" entry
         (file+headline nil "Tasks")
         "** TODO %?   :fix:\n   %i\n   %a\n   %T")
	("n" "Note" entry
	 (file+headline nil "Note")
	 "** Note %?\n   :fix:\n   %i\n   %a\n   %T")
        ("i" "Idea" entry
         (file+headline nil "New Ideas")
         "** %?\n   %i\n   %a\n   %T")))
(global-set-key (kbd "C-c c") 'org-capture)
