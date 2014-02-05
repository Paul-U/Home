;;
;; Org-mode Settings
;;

;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'auto-fill-mode)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

(setq org-file-apps '(("pdf" . "epdfview %s")))

;; TODO状態
(setq org-todo-keywords 
      '((sequence "TODO(t)" "WAIT(w)"  "|" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)

;; ------------------------------------------------------------------------
;; @ export

(eval-after-load "ox"
  (quote
   (progn
     ;; LaTeX Export Settings
     (require 'ox-latex)
     (setq org-latex-pdf-process '("platex %b -shell-escape" "platex %b" "dvipdfmx %b"))

     (setq org-latex-coding-system 'utf-8)
     (setq org-latex-date-format "%Y-%m-%d")
     (setq org-latex-default-figure-position "hbt")
     (setq org-confirm-babel-evaluate nil)
					;(setq org-latex-classes nil)
     (setq simple-latex-structure
	   '(
	     ("\\section{%s}" . "\\section*{%s}")
	     ("\\subsection{%s}" . "\\subsection*{%s}")
	     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	     ("\\paragraph{%s}" . "\\paragraph*{%s}")
	     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	   )
     (setq org-latex-classes nil)
     (setq org-latex-with-hyperref nil)
     (add-to-list 'org-latex-classes
		  (append
		   (list
		    "jsarticle"
		    (concat
		     "\\documentclass[a4j,11pt]{jsarticle}\n"
		     "[NO-DEFAULT-PACKAGES][PACKAGES][EXTRA]"
		     ))
		   simple-latex-structure
		   ))
     (add-to-list 'org-latex-classes
		  (append
		   (list
		    "resume" 
		    (concat
		     "\\documentclass[a4j,11pt]{jsarticle}\n"
		     "\\usepackage{resume}"
		     "[NO-DEFAULT-PACKAGES][PACKAGES][EXTRA]"
		     ))
		   simple-latex-structure
		   ))
     (add-to-list 'org-latex-classes
		  (append
		   (list
		    "abstract" 
		    (concat
		     "\\documentclass[a4j,10pt,twocolumn,oneside]{jsarticle}\n"
		     "\\usepackage{thesis_abstract}\n"
		     "[NO-DEFAULT-PACKAGES]\n[PACKAGES]\n[EXTRA]"
		     ))
		   simple-latex-structure
		   ))
     (add-to-list 'org-latex-classes
		  (append
		   (list
		    "jsbook"
		    (concat
		     "\\documentclass[a4j,12pt,oneside]{jsbook}\n"
		     "[NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
		     )
		    )
		   '(("\\chapter{%s}" . "\\chapter*{%s}"))
		   simple-latex-structure
		   ))
     (setq org-latex-default-class "jsarticle")

     (load "ox-reveal" 'noerror)
     (eval-after-load "ox-reveal"
       (setq org-reveal-root
	     (concat (getenv "HOME") "/.emacs.d/etc/reveal.js"))
       )

     (load "graphviz-dot-mode" 'noerror)
     (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t) (dot . t) (R . t)))
     
     )
   )
  )


(eval-after-load "ob"
  (quote
   (progn
     (require 'ox-reveal)
     (require 'graphviz-dot-mode)
     (require 'ob-R)
     (setq org-src-lang-modes 
	   (append '(("dot" . graphviz-dot))
		   (delq (assoc "dot" org-src-lang-modes)
			 org-src-lang-modes)))
     
     (autoload 'R-mode "ess-site" nil t)
     (setq org-src-lang-modes 
	   (append '(("R" . R))
		   (delq (assoc "R" org-src-lang-modes)
			 org-src-lang-modes)))
     )
   )
  )

;; ------------------------------------------------------------------------
;; @ agenda

(eval-after-load "org-agenda"
  (quote
   (progn
     ;; アジェンダ表示の対象ファイル
     (setq org-agenda-files (list org-directory))
     ;; アジェンダ表示で下線を用いる
     (add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
     ;;(setq hl-line-face 'underline)
     ;; 標準の祝日を利用しない
     (setq calendar-holidays nil)
     )
   )
  )

;; ------------------------------------------------------------------------
;; @ capture

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
	 "** Note %?   :fix:\n   %i\n   %a\n   %T")
	("i" "Idea" entry
	 (file+headline nil "New Ideas")
	 "** %?\n   %i\n   %a\n   %T")
	("l" "Life Log" entry
	 (file+headline "~/org/lifelog.org" "Life Log")
	 "** %?\n   %t")
	("d" "Diary" entry
	 (file+datetree "~/org/diary.org")
	 "** Diary \"%^{prompt}\" %t\n   \n")
	))
(global-set-key (kbd "C-c c") 'org-capture)

