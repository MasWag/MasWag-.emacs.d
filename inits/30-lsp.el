;;; 30-lsp --- Setting for LSP
;;; Commentary:
;;; Code:
(require 'use-package)

;; https://github.com/emacs-lsp/lsp-haskell/issues/47
(setenv "PATH" (concat (getenv "PATH") ":/Users/calros/.local/bin:/home/calros/.local/bin"))
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  (lsp-prefer-flymake nil)
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  ;; LSP-UI tools
  ;(require 'lsp-clients)
  (use-package lsp-ui
    :custom
    ;; lsp-ui-doc
    ;; (lsp-ui-doc-enable t)
    ;; (lsp-ui-doc-header t)
    ;; (lsp-ui-doc-include-signature t)
    ;; (lsp-ui-doc-position 'top) ;; top, bottom, or at-point
    ;; (lsp-ui-doc-max-width 150)
    ;; (lsp-ui-doc-max-height 30)
    ;; (lsp-ui-doc-use-childframe t)
    ;; (lsp-ui-doc-use-webkit t)
    ;; lsp-ui-flycheck
    (lsp-ui-flycheck-enable t)
    :commands lsp-ui-mode
    :hook
    (lsp-mode . lsp-ui-mode))
  (leaf helm-lsp
    :ensure t
    :commands helm-lsp-workspace-symbol)
  (leaf dap-mode
    :ensure t
    :require t)
  (setq lsp-document-sync-method lsp--sync-incremental) ;; 'inclemental を指定してはいけない
  (setq lsp-completion-provider t)
  ;; company-mode
  ;; (use-package company-lsp
  ;;   :commands company-lsp
  ;;   :custom
  ;;   (company-lsp-cache-item-candidates nil)
  ;;   (company-lsp-async t)
  ;;   (company-lsp-enable-recompletion t)
  ;;   (company-lsp-enable-snippet t)
  ;;   :after
  ;;   (lsp-mode company lsp-ui yasnippet)
  ;;   :init 
  ;;   (push 'company-lsp company-backends))
)
