(require 'ggtags)

;; flycheck
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
(add-hook 'ruby-mode-hook 'ggtags-mode)
