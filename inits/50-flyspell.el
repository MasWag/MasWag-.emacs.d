;;; 50-flyspell --- Setting for flyspell
;;; Commentary:

;;; Code:

(use-package flyspell
  :ensure t
  :hook (yatex-mode . flyspell-mode)
  :hook (org-mode . flyspell-mode)
  :hook (markdown-mode . flyspell-mode)
  :bind (:map flyspell-mode-map
              ("C-;" . nil)))

(provide '50-flyspell)
;;; 50-flyspell.el ends here
