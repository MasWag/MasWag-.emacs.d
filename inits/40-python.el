;;; 40-python -- Configuration for python
;;; Commentary:
;;; Code:

(setq python-shell-completion-native t)
(add-to-list 'python-shell-completion-native-disabled-interpreters "python")

;; lsp-pyright
;; (leaf lsp-pyright
;;   :ensure t
;;   :require t
;;   :config
;;   (add-hook 'python-mode-hook
;;             #'(lambda nil
;;                 (require 'lsp-pyright)
;;                 (lsp))))

(require 'leaf)
(leaf python-mode :ensure t
  :interpreter ("python")
  (leaf pyvenv :ensure t :require t)
  (leaf pipenv :ensure t :require t
    :init
    ;; (setq
    ;;  pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended)
    (setq pipenv-with-flycheck nil)
    )
  ;;
  (leaf python-environment :ensure t :require t
    :doc "Required by: jedi-core"
    )

  (leaf company-jedi :ensure t :require t
    :init
    (leaf jedi-core :ensure t :require t
      :commands (jedi:setup)
      :hook
      (python-mode-hook . (lambda ()
                            (jedi:setup)
                            (set (make-local-variable 'company-backends)
                                 '(company-jedi company-dabbrev-code company-ispell))))
      :config
      (setq jedi:tooltip-method nil)  ;; pos-tip and/or popup, nil is minibuffer
      (setq jedi:complete-on-dot t)
      (setq jedi:use-shortcuts nil) ;; M-. and M-,
      )
    )

  (leaf lsp-pylsp :ensure nil :require t
    :doc "Fork of the python-language-server project."
    :config
    (setq lsp-pylsp-plugins-black-enabled t)
    (setq lsp-pylsp-plugins-pylint-enabled t)
    ;;(setq lsp-pylsp-plugins-flake8-enabled t)
    ))

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
