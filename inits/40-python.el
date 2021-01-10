;;; 40-python -- Configuration for python
;;; Commentary:
;;; Code:
(setq python-shell-completion-native t)
(add-to-list 'python-shell-completion-native-disabled-interpreters "python")

;;; elpy (melpa-stable)
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (setq elpy-rpc-virtualenv-path 'current)
  (when (load "flycheck" t t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))
(provide '40-python)
;;; 40-python.el ends here
