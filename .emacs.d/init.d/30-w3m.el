(setq w3m-language "Japanese")

(autoload 'w3m-search "w3m-search" nil t)
(eval-after-load "w3m-search"
  (add-hook 'w3m-mode-hook
	    '(lambda () (linum-mode 0)))
  (add-to-list 'w3m-search-engine-alist '("google-ja" "http://www.google.co.jp/search?q=%s&ie=utf-8&oe=utf-8&aq=t&hl=ja&client=emacs-w3m"))
  (setq w3m-search-default-engine "google-ja")
  (setq w3m-home-page "http://www.google.co.jp/")
  (setq w3m-default-coding-system "UTF-8")

  (add-to-list 'w3m-uri-replace-alist '("\\`g:" w3m-search-uri-replace "google-ja"))
  )
