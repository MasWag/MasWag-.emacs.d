;;; local_settings --- local and confidential settings
;;; Commentary:

;;; Code:
(provide 'local_settings)

(cond ((equal (system-name) "Masakis-MacBook-Pro.local")
       (load-file "/usr/local/share/nusmv/contrib/nusmv-mode.el"))
      ((equal (system-name) "reimu")
       (load-file "/opt/nusmv/share/nusmv/contrib/nusmv-mode.el")))

(setq todoist-token "ff31ef62eebec202624703ec7d6beefa847c6e86")

;;; local_settings.el ends here
