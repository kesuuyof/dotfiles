;;php-mode
(when (require 'php-mode' nil t)
  (add-to-list 'suto-mode-alist '("\\.ctp\\'" . php-mode))
  (setq php-search-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja/"))
  
;; adjust php-mode indent
(defun php-indent-hook ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)
  ;; (c-set-offset 'case-label '+)  ;case label of switch
  (c-set-offset 'arglist-intro '+)  ;when the last element of array is indention
  (c-set-offset 'arglist-close 0')) ;the closing parenthesis of array

;; mmm-mode in php
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
(mmm-add-classes
 '((html-php
    :submode php-mode
    :front "<\\?\\(php\\)?"
    :back "\\?>")))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . xml-mode))
