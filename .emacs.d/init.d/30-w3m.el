(setq w3m-language "Japanese")
(require 'w3m-search)
(add-hook 'w3m-mode-hook
	  '(lambda () (linum-mode 0)))
