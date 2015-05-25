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

(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "/usr/bin/clang-complete")
  (add-to-list 'ac-sources 'ac-source-clang-async)
  (setq ac-clang-cflags '("-std=c++11"))
  (ac-clang-launch-completion-process))

(add-hook 'c++-mode-hook 'ac-cc-mode-setup)

;; .hをc++-modeにする
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(define-key c++-mode-map "\C-xc" 'compile)
