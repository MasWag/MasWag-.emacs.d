;;; 40-Markdown --- Setting for Markdown
;;; Commentary:

;;; Code:
(require 'use-package)

(use-package markdown-mode
  :init
  :config
  (progn
    (add-hook 'markdown-mode-hook 'pandoc-mode)
    (add-hook 'markdown-mode-hook 'flyspell-mode))
  :mode (("\\.md$" . markdown-mode)))

(provide '40-Markdown)
;;; 40-Markdown.el ends here
