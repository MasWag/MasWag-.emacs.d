;;; 40-Turtle --- Setting for Turtle/N3
;;; Commentary:

;;; Code:
(require 'use-package)

(use-package ttl-mode
  :init
  (require 'ttl-mode)
  :config
  (add-hook 'ttl-mode-hook 'turn-on-font-lock)
  :mode (("\\.n3$" . ttl-mode)
         ("\\.nt$" . ttl-mode)
         ("\\.ttl$" . ttl-mode)))

(provide '40-Turtle)
;;; 40-Turtle.el ends here
