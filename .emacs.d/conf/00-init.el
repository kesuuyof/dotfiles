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

;; column number
(column-number-mode t)

;; color
(add-to-list 'default-frame-alist '(foreground-color . "cyan"))
;;(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
(add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
(set-face-foreground 'modeline "black")
(set-face-background 'modeline "MediumPurple2")
(set-face-background 'region "DarkOrange4")
(set-face-foreground 'mode-line-inactive "gray30")
(set-face-background 'mode-line-inactive "gray85")

;; backup directory
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; Interactively Do Things (highly recommended, but not strictly required)
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido)
(ido-mode t)


;; use older version of Emacs23
;; add derectory define
(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))

;; define add-to-load-path function
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; add to load path
(add-to-load-path "elisp" "conf" "public_repos")
