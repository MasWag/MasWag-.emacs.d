;;; Package -- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (flycheck-add-mode 'tex-chktex 'yatex-mode)
  (flycheck-add-mode 'tex-lacheck 'yatex-mode)
  (cond ((equal (system-name) "Masakis-MacBook-Pro.local")
         (setq flycheck-tex-chktex-executable "/Library/TeX/texbin/chktex")
  )))

(require 'vhdl-mode)
(define-key flycheck-mode-map (kbd "M-n") 'flycheck-next-error)
(define-key flycheck-mode-map (kbd "M-p") 'flycheck-previous-error)

(setq flycheck-cppcheck-checks "all")


(flycheck-define-checker vhdl-ghdl
  "A VHDL syntax checker using ghdl."
  :command ("ghdl" "-s" "--std=93" "--ieee=synopsys" "-fexplicit" source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" column
	  ": " (message) line-end))
  :modes vhdl-mode)
(flycheck-set-checker-executable 'vhdl-ghdl)


(add-hook 'vhdl-mode-hook
          '(lambda ()
             (setq flycheck-checker 'vhdl-ghdl)
             (flycheck-mode 1)))

;; Flycheck Grammarly
;; (use-package flycheck-grammarly
;;   :config
;;   (flycheck-add-mode 'grammarly-checker 'text-mode)
;;   :ensure t
;;   )

;; (add-hook 'yatex-mode-hook
;;           '(lambda ()
;;              (setq flycheck-checker 'tex-chktex)
;;              (flycheck-mode 1)))

(provide '50-flycheck)
;;; 50-flycheck.el ends here
