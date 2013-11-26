;; (when (require 'evernote-mode nil t)
;;   (if (require 'w3m-load nil t)
;;       (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))) ; optional
;;   (setq evernote-developer-token "S=s128:U=d4d838:E=14966026525:C=1420e51392d:P=1cd:A=en-devtoken:V=2:H=21d11d656801ce1cc3dccfe2efea2427")
;;   (global-set-key "\C-cec" 'evernote-create-note)
;;   (global-set-key "\C-ceo" 'evernote-open-note)
;;   (global-set-key "\C-ces" 'evernote-search-notes)
;;   (global-set-key "\C-ceS" 'evernote-do-saved-search)
;;   (global-set-key "\C-cew" 'evernote-write-note)
;;   (global-set-key "\C-cep" 'evernote-post-region)
;;   (global-set-key "\C-ceb" 'evernote-browser)
;;   (setq evernote-username "kouzukek")  ; Evernote アカウント名
;;   (define-key evernote-mode-map (kbd "C-c t") 'evernote-toggle-read-only) ; default is C-x C-q
;; )
