(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(setq ac-use-menu-map t)
(define-key ac-menu-map "C-n" 'ac-next)
(define-key ac-menu-map "C-p" 'ac-previous)
(add-to-list 'ac-sources 'ac-source-gtags)
(add-to-list 'ac-sources 'ac-source-yasnippet)
