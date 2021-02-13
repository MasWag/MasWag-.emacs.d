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
    :ensure t)
  (use-package magit-gh-pulls
    :ensure t)
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :bind (("\C-xgs" . magit-status)
          ("\C-xgb" . magit-show-refs-popup))
  :hook
  (magit . magit-gitflow)
  (magit . magit-gh-pulls)
  (magit . magithub))

;;; 30-magit ends here


