;;; 40-haskell --- Setting for Haskell
;;; Commentary:

;;; Code:
(require 'use-package)

(use-package haskell-mode
  :init
  (require 'flycheck)
  (progn
    (setq haskell-mode-hook nil)
    (add-hook 'haskell-mode-hook #'haskell-indentation-mode)
    (add-hook 'haskell-mode-hook #'interactive-haskell-mode)
    ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
    ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
    ;; (add-hook 'haskell-mode-hook 'font-lock-mode)
    ;; (add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
    )

  :config

  :bind (("C-," . haskell-move-nested-left)
         ("C-." . haskell-move-nested-right)
         ("C-c C-c" . haskell-compile)
         ("C-x C-d" . nil)
         ("C-c C-z" . haskell-interactive-switch)
         ("C-c C-l" . haskell-process-load-file)
         ("C-c C-b" . haskell-interactive-switch)
         ("C-c C-t" . haskell-process-do-type)
         ("C-c C-i" . haskell-process-do-info)
         ("C-c M-." . nil)
         ("C-c C-d" . nil))

  :mode (("\\.hs$" . haskell-mode)
         ("\\.lhs$" . literate-haskell-mode)
         ("\\.cabal\\'" . haskell-cabal-mode))
)

(provide '40-haskell)
;;; 40-haskell.el ends here

;; haskell mode
;; (autoload 'haskell-mode "haskell-mode" nil t)
;; (autoload 'haskell-cabal "haskell-cabal" nil t)

;; (add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
;; (add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

;; (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
;; (eval-after-load "which-func"
;;   '(add-to-list 'which-func-modes 'haskell-mode))
;; (eval-after-load "haskell-cabal"
;;   '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

;; (setq haskell-compile-cabal-build-command "cd %s && stack build --ghc-options -ferror-spans")


;; ;; haskell script
;; (add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
;; (add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))


;; ;; ghci
;; (setq haskell-process-type 'stack-ghci)
;; (setq haskell-process-path-ghci "stack")
;; (setq haskell-process-args-ghci "ghci")

;; (add-hook 'haskell-mode-hook 'inferior-haskell-mode)

;; (defadvice inferior-haskell-load-file (after change-focus-after-load)
;;   "Change focus to GHCi window after C-c C-l command"
;;   (other-window 1))
;; (ad-activate 'inferior-haskell-load-file)

;; Local settings
(cond ((equal (system-name) "Masakis-MacBook-Pro.local")
       (setq haskell-program-name "/usr/local/bin/stack ghci")
       )
      ((equal (system-name) "reimu")
       (setq haskell-program-name "/usr/bin/stack ghci")
       ))
