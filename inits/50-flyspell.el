(require 'flyspell)

(define-key flyspell-mode-map (kbd "C-;") nil)

(mapc
 (lambda (hook)
   (add-hook hook
             '(lambda () (flyspell-mode 1))))
 '(markdown-mode-hook yatex-mode-hook org-mode-hook))
