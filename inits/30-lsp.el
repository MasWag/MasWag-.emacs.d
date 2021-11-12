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
  (setq lsp-completion-provider :capf)
  ;; LSP-UI tools
  ;(require 'lsp-clients)

lsp-completion-enable

  (use-package lsp-ui
    :custom
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
