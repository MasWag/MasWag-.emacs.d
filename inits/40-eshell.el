(require 'pcomplete)

(add-to-list 'ac-modes 'eshell-mode)

(ac-define-source pcomplete
  '((candidates . pcomplete-completions)))

(defun my-ac-eshell-mode ()
  (setq ac-sources
        '(ac-source-pcomplete
          ac-source-words-in-buffer
          ac-source-dictionary)))

(add-hook 'eshell-mode-hook
          (lambda ()
            (my-ac-eshell-mode)
            (define-key eshell-mode-map (kbd "C-i") 'auto-complete)))
