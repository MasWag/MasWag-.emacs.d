;;; 30-magit --- Setting for magit
;;; Commentary:

;;; Code:
(require 'use-package)
(use-package magit
  :ensure t
  :init
  (use-package magit-gitflow
    :ensure t)
  (use-package magithub
    :after magit
    :config
    (magithub-feature-autoinject t)
    :ensure t)
  (use-package magit-gh-pulls
    :ensure t)
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :bind (("C-x g s" . magit-status)
          ("C-x g b" . magit-show-refs-popup))
  :hook
  (magit . magit-gitflow)
  (magit . magit-gh-pulls)
  ;(magit . magithub)
)

;;; 30-magit ends here


