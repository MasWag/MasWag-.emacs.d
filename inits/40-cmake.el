;;; Code:
(use-package company-cmake
  :init
  (setq company-cmake-executable
        (s-chomp (shell-command-to-string "command -v cmake"))))

