;;; 40-Rust ---  Setting for Rust
;;; Commentary:

;;; Code:

(use-package rust-mode
  :init (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
  (add-hook 'rust-mode-hook (lambda ()
                              (racer-mode)
                              (flycheck-rust-setup)))
  :mode (("\\.rs\\'" . rust-mode))
  :config
  (setq-default rust-format-on-save t)
  (cond ((equal (system-name) "Masakis-MacBook-Pro.local")
         (setq racer-rust-src-path "~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")))
  )

(use-package racer
  :commands racer-mode
  :init
  ;;; racerのeldocサポートを使う
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  )

(provide '40-Rust)
;;; 40-Rust.el ends here
