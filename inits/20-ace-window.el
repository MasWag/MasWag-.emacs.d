;;; 20-ace-window.el --- Configuration for ace-window
;;; Commentary:
;;; Code:
(use-package ace-window
  :custom
  (aw-keys '(?j ?k ?l ?i ?o ?h ?y ?u ?p))
  :bind (("C-c w" . ace-window))
  :custom-face
  (aw-leading-char-face ((t (:height 4.0 :foreground "#f1fa8c")))))
(provide '20-ace-window)
;;; 20-ace-window.el ends here
