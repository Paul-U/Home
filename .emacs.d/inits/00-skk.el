(setq skk-isearch-mode-enable 'always)
(setq default-input-method
      "japanese-skk"			; (skk-mode 1)
;;    "japanese-skk-auto-fill"		; (skk-auto-fill-mode 1)
      )
(global-set-key [zenkaku-hankaku] 'skk-mode)
(setq skk-kutouten-type 'jp-en)
