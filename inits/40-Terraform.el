;;; 40-Terraform --- Setting for Terraform
;;; Commentary:

;;; Code:
(leaf terraform-mode
  :mode ("\\.tf$")
  :config
  (leaf company-terraform)
  
  (add-to-list 'company-backends
               '(company-terraform)))
