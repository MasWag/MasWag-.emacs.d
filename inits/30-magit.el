(require 'magit)
(require 'magit-gitflow)
(global-set-key "\C-xgs" 'magit-status)
(global-set-key "\C-xgb" 'magit-show-refs-popup)

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
