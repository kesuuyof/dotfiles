;; window size
(setq initial-frame-alist '((width . 50) (height . 38) (top . 0) (left . 150)))

;; no sound
(setq visible-bell t)

;; disable startup page
(setq inhibit-startup-message t)

;; semi-transparent
(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; hide menu bar
(tool-bar-mode -1)

;; row number
(line-number-mode t)

;; color
(add-to-list 'default-frame-alist '(foreground-color . "cyan"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
(add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
(set-face-foreground 'modeline "black")
(set-face-background 'modeline "MediumPurple2")
(set-face-background 'region "DarkOrange4")
(set-face-foreground 'mode-line-inactive "gray30")
(set-face-background 'mode-line-inactive "gray85")

;; backup directory
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; font
(set-face-attribute 'default nil :family "Ricty" :height 200)
(set-fontset-font "fontset-default" 'japanese-jisx0208 ' ( "Ricty" . "iso10646-*"))

;; Interactively Do Things (highly recommended, but not strictly required)
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido)
(ido-mode t)
