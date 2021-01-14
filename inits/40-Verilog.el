;;; 40-Verilog --- Setting for Verilog
;;; Commentary:

;;; Code:
(use-package verilog-mode
  ;; .v or .vt files are verilog files
  :mode (("\\.v$" . verilog-mode)
         ("\\.vt$" . verilog-mode))
  :config
  ;; use flycheck to check the verilog syntax
  (use-package flycheck
    :ensure t
    :hook (after-init . global-flycheck-mode)
    :config
    (flycheck-add-mode 'verilog-verilator 'verilog-mode)
    ;; in order to enable verilog-verilator, you have to install verilator, e.g., by `brew install verilator`(in macOS) .
    )
  ;; use ggtags for tag jump
  (use-package ggtags
    :ensure t
    )
  :hook (verilog-mode ggtags-mode)
  :bind (:map verilog-mode-map
              ("M-*" . ggtags-navigation-mode-abort)))
;;; 40-Verilog.el ends here
