;;; 40-maxima -- Configuration for maxima
;;; Commentary:
;;; Code:
(use-package maxima
  :ensure t
  :init
  (use-package company-maxima
    :ensure t
    )
  (add-to-list 'company-backends '(company-maxima-symbols company-maxima-libraries))
  :config
  (use-package org
    :config
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))
  (setq maxima-display-maxima-buffer nil)
  :mode ("\\.mac\\'" . maxima-mode)
  :interpreter ("maxima" . maxima-mode))
(provide '40-maxima)
;;; 40-maxima.el ends here
