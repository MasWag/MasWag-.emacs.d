;;; 40-Rust ---  Setting for Rust
;;; Commentary:

;;; Code:

(use-package rust-mode
  :ensure t
  :init (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
  (add-hook 'rust-mode-hook (lambda ()
                              (racer-mode)
                              (flycheck-rust-setup)))
  :mode (("\\.rs\\'" . rust-mode))
  :custom rust-format-on-save t)

(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

(use-package lsp-mode
  :ensure t
  :init (yas-global-mode)
  :hook (rust-mode . lsp)
  :bind ("C-c h" . lsp-describe-thing-at-point)
  :custom (lsp-rust-server 'rust-analyzer))

(use-package lsp-ui
  :ensure t)

(use-package racer
  :commands racer-mode
  :init
  ;;; racerのeldocサポートを使う
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  :config
  (cond ((equal (system-name) "Masakis-MacBook-Pro.local")
         (setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")))
  )

(provide '40-Rust)
;;; 40-Rust.el ends here
