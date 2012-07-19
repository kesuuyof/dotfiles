;; http://sakito.jp/emacs/emacsshell.html
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;; shell の存在を確認
(defun skt:shell ()
  (or 
   ;;(executable-find "zsh")
   (executable-find "bash")
   (when (eq system-type 'windows-nt)
     (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
     (executable-find "f_bash")) ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
   (executable-find "cmdproxy")
   (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

;; escape
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; shotcut
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (term shell-file-name)))

;; multi-term
(require 'multi-term)
(setq multi-term-program shell-file-name)
(add-hook 'term-mode-hook
         '(lambda ()
            ;; C-h を term 内文字削除にする
            (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
            ;; C-y を term 内ペーストにする
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            ))
;; multi-term 呼びだし用キー割り当て
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (multi-term)))
;; キーで起動した時に複数起動でなく既存のバッファを選択する
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (if (get-buffer "*terminal<1>*")
                                    (switch-to-buffer "*terminal<1>*")
                                (multi-term))))
;; Shell のバッファを切り替える
(global-set-key (kbd "C-c n") 'multi-term-next)
(global-set-key (kbd "C-c p") 'multi-term-prev)


;;(when (require 'multi-term nil t)
;;  (set multi-term-program "zsh"))


;; キーを取り戻す
(add-to-list 'term-unbind-key-list '"M-x")
(add-to-list 'term-unbind-key-list '"C-v")
(add-to-list 'term-unbind-key-list '"C-t")
(add-to-list 'term-unbind-key-list '"C-e")
(add-to-list 'term-unbind-key-list '"C-a")
(add-to-list 'term-unbind-key-list '"C-Space")

(custom-set-variables
 '(term-default-fg-color "#ffffff")
 (when (eq system-type 'windows-nt)
   '(term-default-bg-color "#000000")))
