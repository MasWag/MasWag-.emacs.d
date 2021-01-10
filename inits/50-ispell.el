;;; 50-ispell --- Configuration for spell checker
;;; Commentary:
;;; Code:

(use-package ispell
  :init
  (setq-default ispell-program-name "aspell")
  :config
  (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))
  )


;; Local settings
(cond ((equal (system-name) "Masakis-MacBook-Pro.local")
       (setq ispell-program-name "/usr/local/bin/aspell")
       (setq exec-path (append exec-path '("/usr/local/bin")))
       (setq ispell-alternate-dictionary "/usr/share/dict/words")
       (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
       ))

(provide '50-ispell)
;;; 50-ispell.el ends here
