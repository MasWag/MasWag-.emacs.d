;;; 30-magit --- Setting for magit
;;; Commentary:

;;; Code:
(require 'use-package)
(use-package magit
  :init
  (require 'magit-gitflow)
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :bind (("\C-xgs" . magit-status)
          ("\C-xgb" . magit-show-refs-popup))
  :hook
  (magit . magit-gitflow))

;;; 30-magit ends here


