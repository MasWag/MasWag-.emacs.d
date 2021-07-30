;;; 40-C.el --- Configuration for C/C++
;;; Commentary:
;;; Code:
;; (eval-after-load "yasnippet"
;;   '(progn
;;      ;; companyと競合するのでyasnippetのフィールド移動は "C-i" のみにする
;;      (define-key yas-keymap (kbd "<tab>") nil)
;;      (yas-global-mode 1)))

(use-package irony
  :commands irony-mode
  :config
  (custom-set-variables '(irony-additional-clang-options '("-std=c++17")))
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'irony-mode-hook 'irony-eldoc)
  (add-hook 'c-mode-common-hook 'irony-mode))
;; (require 'ggtags)
;; (add-hook 'c-mode-hook 'ggtags-mode)
;; (add-hook 'c++-mode-hook 'ggtags-mode)

;; (require 'flycheck)
;; (defun my:flycheck-c-setup ()
;;   (setq flycheck-clang-language-standard "c99"))
;; (defun my:flycheck-c++-setup ()
;;   (setq flycheck-clang-language-standard "c++14"))

;; (use-package company-quickhelp
;;   :ensure t
;;   :after company
;;   :config
;;   (setq company-quickhelp-idle-delay 0.1)
;;   (company-quickhelp-mode 1))

(use-package company-irony
  :ensure t
  :after (company irony)
  :commands (company-irony)
  :config
  (add-to-list 'company-backends '(company-irony-c-headers company-irony))
  (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands))

;; (use-package company-irony-c-headers
;;   :ensure t
;;   :commands (company-irony-c-headers)
;;   :after company-irony)

;; (when (require 'rtags nil 'noerror)
;;   (add-hook 'c-mode-common-hook
;;             (lambda ()
;;               (when (rtags-is-indexed)
;;                 (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
;;                 (local-set-key (kbd "M-;") 'rtags-find-symbol)
;;                 (local-set-key (kbd "M-@") 'rtags-find-references)
;;                 (local-set-key (kbd "M-,") 'rtags-location-stack-back)))))

;; (when (require 'flycheck nil 'noerror)
;;   (define-key flycheck-mode-map (kbd "C-M-n") 'flycheck-next-error)
;;   (define-key flycheck-mode-map (kbd "C-M-p") 'flycheck-previous-error)
;;   (add-hook 'c-mode-common-hook 'flycheck-mode))

;; flycheck-mode
(eval-after-load "flycheck"
  '(progn
     (when (locate-library "flycheck-irony")
       (flycheck-irony-setup))))

;; (add-hook 'c++-mode-hook 'flycheck-mode)
;; (add-hook 'c-mode-hook 'flycheck-mode)
;; (eval-after-load 'flycheck
;; '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; ;; eldoc-mode
;; (add-hook 'irony-mode-hook 'irony-eldoc)

(leaf bison-mode
  :mode ("\\.yy$")
  :require t)

;; ;; (add-hook 'c-mode-hook 'my:flycheck-c-setup)
;; ;; (add-hook 'c++-mode-hook 'my:flycheck-c++-setup)

;; ;; (delete 'complete-semantic company-backends)
;; ;; (add-to-list 'company-backends 'company-c-headers)

;; ;; (define-key c-mode-map [(tab)] 'company-complete)
;; ;; (define-key c++-mode-map [(tab)] 'company-complete)


;; ;; ;;; CDE
;; ;; (require 'semantic)
;; ;; (global-semanticdb-minor-mode 1)
;; ;; (global-semantic-idle-scheduler-mode 1)
;; ;; (semantic-mode 1)

;; ;; (semantic-add-system-include "/usr/include/boost" 'c++-mode)

;; ;; ;; .hをc++-modeにする
;; ;; (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; ;; ;; (define-key c++-mode-map "\C-xc" 'compile)

(provide '40-C)
;;; 40-C.el ends here
