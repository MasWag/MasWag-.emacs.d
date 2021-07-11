;;; 40-Verilog --- Setting for Verilog
;;; Commentary:

;;; Code:
(leaf verilog-mode
  :bind ((verilog-mode-map
          ("M-*" . ggtags-navigation-mode-abort)))
  :mode ("\\.v$" "\\.vt$")
  :hook (verilog-mode-hook ggtags-mode-hook)
  :config
  (use-package flycheck
    :ensure t
    :hook (after-init . global-flycheck-mode)
    :config
    (flycheck-add-mode 'verilog-verilator 'verilog-mode))

  (use-package ggtags
    :ensure t))
;;; 40-Verilog.el ends here
