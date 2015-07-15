(require 'ggtags)
(add-hook 'verilog-mode-hook 'ggtags-mode)
(define-key verilog-mode-map "\M-*" 'ggtags-navigation-mode-abort)vim
