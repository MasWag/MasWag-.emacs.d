;;; 50-migemo --- Setting for Migemo
;;; Commentary:

;;; Code:
(require 'use-package)

(use-package migemo
  :ensure t
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-directory "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
  )

(provide '50-migemo.el)
;;; 50-migemo.el ends here
