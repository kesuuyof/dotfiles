(when (eq system-type 'windows-nt)
  ;; font
  (set-face-attribute 'default nil
                      :family "Ricty Regular"
                      :height 140)
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("Ricty Regular" . "jisx0208-sjis"))
  (add-to-list 'face-font-rescale-alist
               `(,(encode-coding-string ".*Ricty Regular.*" 'emacs-mule) . 1.4))
  (add-to-list 'default-frame-alist '(background-color . "black")))
