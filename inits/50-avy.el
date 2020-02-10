;;; 50-avy --- Setting for Avy
;;; Commentary:

;;; Code:
(require 'use-package)

(use-package avy
  :config
  (use-package avy-migemo
    :config
    (avy-migemo-mode 1)
    :bind (("M-g m m" . avy-migemo-mode))
    )
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
;         ("C-'" . avy-goto-char-timer)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0)
         ("C-c C-j" . avy-resume)
         )
  )

(provide '50-avy.el)
;;; 50-avy.el ends here



