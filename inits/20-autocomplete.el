(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(setq ac-use-menu-map t)
(define-key ac-menu-map "C-n" 'ac-next)
(define-key ac-menu-map "C-p" 'ac-previous)
(add-to-list 'ac-sources 'ac-source-gtags)
(add-to-list 'ac-sources 'ac-source-yasnippet)

(eval-after-load "auto-complete"
  '(progn
      (ac-ispell-setup)))

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'yatex-mode-hook 'ac-ispell-ac-setup)
(add-hook 'text-mode-hook 'ac-ispell-ac-setup)
(add-hook 'markdown-mode-hook 'ac-ispell-ac-setup)

