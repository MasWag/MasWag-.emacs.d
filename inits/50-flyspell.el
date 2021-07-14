;;; 50-flyspell --- Setting for flyspell
;;; Commentary:

;;; Code:

(leaf flyspell
  :ensure t
  :bind ((flyspell-mode-map
          ("C-;")))
  :hook (yatex-mode-hook org-mode-hook markdown-mode-hook))

(provide '50-flyspell)
;;; 50-flyspell.el ends here
