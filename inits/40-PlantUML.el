;;; 40-PlantUML ---  Setting for PlantUML
;;; Commentary:

;;; Code:
(use-package plantuml-mode
  :ensure t
  :commands plantuml-mode
  :mode (("\\.pu$" . plantuml-mode)
         ("\\.plantuml$" . plantuml-mode)
         ("\\.puml$" . plantuml-mode))
  :config
  (setq plantuml-default-exec-mode 'executable)
  (cond ((equal (system-name) "MacBook-Pro-3.local")
         (setq plantuml-executable-path "/usr/local/bin/plantuml")
         (setq plantuml-jar-path "/usr/local/Cellar/plantuml/1.2021.0/libexec/plantuml.jar")))
  (setq plantuml-jar-args "-charset UTF-8")
  )
(provide '40-PlantUML)
;;; 40-PlantUML.el ends here
