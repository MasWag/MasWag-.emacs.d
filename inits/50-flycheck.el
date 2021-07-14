;;; Package -- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (flycheck-add-mode 'tex-chktex 'yatex-mode)
  (flycheck-add-mode 'tex-lacheck 'yatex-mode)
  (setq flycheck-cppcheck-checks "all")
  (cond ((equal (system-name) "MacBook-Pro-3.local")
         (setq flycheck-tex-chktex-executable "/Library/TeX/texbin/chktex")
         (setq flycheck-tex-lacheck-executable "/Library/TeX/texbin/lacheck")
  ))
  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error))
  :bind (:map flycheck-mode-map
              ("M-p" . flycheck-previous-error)))

(leaf leaf-convert
  :require vhdl-mode
  :config
  (flycheck-define-checker vhdl-ghdl
    "A VHDL syntax checker using ghdl." :command
    ("ghdl" "-s" "--std=93" "--ieee=synopsys" "-fexplicit" source)
    :error-patterns
    ((error line-start
            (file-name)
            ":" line ":" column ": "
            (message)
            line-end))
    :modes vhdl-mode)
  (add-hook 'vhdl-mode-hook
            '(lambda nil
               (setq flycheck-checker 'vhdl-ghdl)
               (flycheck-mode 1))))
;; Flycheck Grammarly
;; (use-package flycheck-grammarly
;;   :config
;;   (flycheck-add-mode 'grammarly-checker 'text-mode)
;;   :ensure t
;;   )

(provide '50-flycheck)
;;; 50-flycheck.el ends here
