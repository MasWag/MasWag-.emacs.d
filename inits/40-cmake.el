;; ;;; Code:
;; (use-package company-cmake
;;   :commands (company-cmake)
;;   :init
;;   (add-hook 'cmake-mode-hook
;;             (lambda ()
;;               (require 's)
;;               ;; Delay the configuration of the cmake executable to when cmake-mode is used
;;               ;; Otherwise, shell-command-to-string does not work somehow
;;               (setq company-cmake-executable
;;                     (s-chomp
;;                      (shell-command-to-string "command -v cmake"))))))
