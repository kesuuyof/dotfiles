;; add load path
(add-to-list 'load-path "~/.emacs.d/elisp")
;;(add-to-list 'load-path "~/.emacs.d/conf")

;; init loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/conf")

