;; Command-Key and Option-Key
;;(setq ns-command-modifier (quote meta))
;;(setq ns-alternate-modifier (quote super))

;; window size
;;(setq initial-frame-alist '((width . 70) (height . 33) (top . 29) (left . 0)))
;; ------------------------------------------------------------------------
;; @ initial frame maximize

;; 起動時にウィンドウ最大化
;; http://www.emacswiki.org/emacs/FullScreen#toc12
(defun jbr-init ()
  "Called from term-setup-hook after the default
   terminal setup is
   done or directly from startup if term-setup-hook not
   used.  The value
   0xF030 is the command for maximizing a window."
  (interactive)
  (w32-send-sys-command #xf030)
  (ecb-redraw-layout)
  (calendar))

(let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-frame-position (selected-frame) 0 0)
         (setq term-setup-hook 'jbr-init)
         (setq window-setup-hook 'jbr-init))
        ((eq ws 'ns)
         ;; for MacBook Air(Late2010) 11inch display
         (set-frame-position (selected-frame) 0 0)
         (set-frame-size (selected-frame) 66 34))))

;; font
(set-face-attribute 'default nil :family "Ricty" :height 200)
(set-fontset-font "fontset-default" 'japanese-jisx0208 ' ( "Ricty" . "iso10646-*"))
