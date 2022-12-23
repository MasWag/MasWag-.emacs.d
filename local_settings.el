;;; local_settings --- local and confidential settings
;;; Commentary:

;;; Code:
(provide 'local_settings)

(cond ((equal (system-name) "MacBook-Pro-3.local")
       (load-file "/usr/local/share/nusmv/contrib/nusmv-mode.el"))
      ((equal (system-name) "reimu")
       (load-file "/opt/nusmv/share/nusmv/contrib/nusmv-mode.el")))

(use-package todoist
  :bind (:map todoist-mode-map
         ("C-k" . todoist-delete-task)
         ("C-c C-t" . todoist-close-task))
  :config
  (setq todoist-token "ff31ef62eebec202624703ec7d6beefa847c6e86"))


;;; local_settings.el ends here
