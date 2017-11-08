(require 'ggtags)
(add-hook 'c-mode-hook 'ggtags-mode)
(add-hook 'c++-mode-hook 'ggtags-mode)

(require 'flycheck)
(defun my:flycheck-c-setup ()
  (setq flycheck-clang-language-standard "c99"))
(defun my:flycheck-c++-setup ()
  (setq flycheck-clang-language-standard "c++11"))


(add-hook 'c-mode-hook 'my:flycheck-c-setup)
(add-hook 'c++-mode-hook 'my:flycheck-c++-setup)

(delete 'complete-semantic company-backends)
(add-to-list 'company-backends 'company-c-headers)

(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)


;;; CDE
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

(semantic-add-system-include "/usr/include/boost" 'c++-mode)

;; .hをc++-modeにする
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; (define-key c++-mode-map "\C-xc" 'compile)
