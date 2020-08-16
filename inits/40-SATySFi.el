;; satysfi
(require 'use-package)
(use-package satysfi
  :mode (("\\.saty$" . satysfi-mode)
         ("\\.satyh$" . satysfi-mode)
         ("\\.satyg$" . satysfi-mode))
  :config
  (cond ((equal (system-name) "Masakis-MacBook-Pro.local")
         (setq satysfi-pdf-viewer-command "open -a Skim")
         (setq satysfi-command "/Users/calros/bin/satysfi")
         )
        ((equal (system-name) "reimu")
         (setq satysfi-pdf-viewer-command "evince")
         (setq satysfi-command "satysfi")
         ))
  ;; Configuration of flycheck for SATySFi
  (require 'flycheck)

  (flycheck-define-checker satysfi-type
    "A SATySFi type checker"
    :command ("satysfi" "-t" source-inplace)
    :error-patterns
    ((error line-start
            "! [" (one-or-more not-newline) "] at \"" (file-name) "\", line " line ", characters " (one-or-more not-newline) "-"column (one-or-more not-newline) "\n"
            (message (one-or-more not-newline)
                     (zero-or-more "\n" (any " ") (one-or-more not-newline))) "." line-end))
    :modes (satysfi-mode))

  (setq flycheck-satysfi-type-executable satysfi-command)

  (add-to-list 'flycheck-checkers 'satysfi-type))
