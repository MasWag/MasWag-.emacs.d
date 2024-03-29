;; satysfi
(require 'use-package)

(use-package satysfi
  :mode (("\\.saty$" . satysfi-mode)
         ("\\.satyh$" . satysfi-mode)
         ("\\.satyg$" . satysfi-mode))
  :hook (satysfi-mode . lsp)
  :config
  (cond ((or (equal (system-name) "Masakis-MacBook-Pro.local")
             (equal (system-name) "MacBook-Pro-3.local"))
         (setq satysfi-pdf-viewer-command "open -a Skim")
         (setq satysfi-command "/Users/calros/bin/satysfi")
         )
        ((equal (system-name) "reimu")
         (setq satysfi-pdf-viewer-command "evince")
         (setq satysfi-command "satysfi")
         ))

  ;; LSP
  (use-package lsp-mode
    :ensure t
    :init
    (add-to-list 'lsp-language-id-configuration '(satysfi-mode . "satysfi-ls"))
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-stdio-connection '("~/.cargo/bin/satysfi-language-server"))
                      :major-modes '(satysfi-mode)
                      :priority 0
                      :activation-fn (lsp-activate-on "satysfi-ls")
                      :server-id 'satysfi-ls)))

  (use-package company
    :ensure t
    :hook
    (satysfi-mode . company-mode)
    :config
    (setq lsp-completion-provider :capf)
    (setq company-minimum-prefix-length 1))
  ;; We use lsp for completion
  (push 'company-capf company-backends)

  ;; Configuration of flycheck for SATySFi
  ;; (require 'flycheck)

  ;; (flycheck-define-checker satysfi-type
  ;;   "A SATySFi type checker"
  ;;   :command ("/Users/calros/bin/satysfi" "-t" source-inplace)
  ;;   :error-patterns
  ;;   ((error line-start
  ;;           "! [" (one-or-more not-newline) "] at \"" (file-name) "\", line " line ", characters " (one-or-more not-newline) "-"column (one-or-more not-newline) "\n"
  ;;           (message (one-or-more not-newline)
  ;;                    (zero-or-more "\n" (any " ") (one-or-more not-newline))) "." line-end))
  ;;   :modes (satysfi-mode))

  ;; (setq flycheck-satysfi-type-executable satysfi-command)

  ;; (add-to-list 'flycheck-checkers 'satysfi-type)
  )
