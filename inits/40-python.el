;;; 40-python -- Configuration for python
;;; Commentary:
;;; Code:

(setq python-shell-completion-native t)
(add-to-list 'python-shell-completion-native-disabled-interpreters "python")

;; lsp-pyright
(leaf lsp-pyright
  :ensure t
  :require t
  :config
  (add-hook 'python-mode-hook
            #'(lambda nil
                (require 'lsp-pyright)
                (lsp))))

;; ;;; elpy (melpa-stable)
;; (leaf elpy
;;   :ensure t
;;   :config
;;   (advice-add 'python-mode :before 'elpy-enable)
;;   (with-eval-after-load 'elpy
;;     (setq elpy-rpc-virtualenv-path 'current)
;;     (when (load "flycheck" t t)
;;       (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;       (add-hook 'elpy-mode-hook 'flycheck-mode))))
(provide '40-python)
;;; 40-python.el ends here
