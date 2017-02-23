(define-key matlab-mode-map "\C-h" 'delete-backward-char)
;; Local settings
(cond ((equal (system-name) "Masakis-MacBook-Pro.local")
       (setq auto-mode-alist
             (append '(("\\.m$" . matlab-mode)) auto-mode-alist))
       ))
