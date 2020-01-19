;;; 40-Terraform --- Setting for Terraform
;;; Commentary:

(require 'use-package)

;;; Code:
(use-package terraform-mode
  :config
  (add-to-list 'company-backends '(company-terraform))
  :mode (("\\.tf$" . terraform-mode)))
