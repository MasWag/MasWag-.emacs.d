(require 'yasnippet)
(yas-global-mode 1)
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))
