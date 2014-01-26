;; enable auto updateing
(setq gtags-auto-update t)

(add-hook 'c-mode-hook 'ggtags-mode)
(add-hook 'c++-mode-hook 'ggtags-mode)
