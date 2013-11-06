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
