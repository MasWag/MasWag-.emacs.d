;;; 40-Ruby --- Setting for Ruby
;;; Commentary:

;;; Code:
(require 'use-package)

(use-package ruby-mode
  :init
  (require 'flycheck)
  :config
  (setq flycheck-ruby-rubocop-executable "/usr/local/var/rbenv/shims/rubocop")
  (progn
    (use-package rbenv
      :init
      (progn
        (setq
         rbenv-modeline-function 'rbenv--modeline-plain
         rbenv-show-active-ruby-in-modeline nil)))

    (use-package ruby-tools)

    (use-package rhtml-mode
      :mode (("\\.rhtml$" . rhtml-mode)
             ("\\.html\\.erb$" . rhtml-mode)))

    (use-package rinari
      :init (global-rinari-mode 1)
      :config (setq ruby-insert-encoding-magic-comment nil))

    (use-package rspec-mode
      :config
      (progn
        (setq rspec-use-rake-flag nil)
        (defadvice rspec-compile (around rspec-compile-around activate)
          "Use BASH shell for running the specs because of ZSH issues."
          (let ((shell-file-name "/bin/bash"))
            ad-do-it))))

    (use-package robe
      :config
      (add-hook 'robe-mode-hook 'ac-robe-setup))

    (use-package enh-ruby-mode
      :config
      (progn
        (add-hook 'ruby-mode-hook 'rbenv-use-corresponding)
        (add-hook 'ruby-mode-hook 'rspec-mode)
        (add-hook 'enh-ruby-mode-hook 'robe-mode)
        (add-hook 'enh-ruby-mode-hook 'yard-mode))))

  :config
  (progn
    (add-hook 'ruby-mode-hook 'robe-mode)
    (add-hook 'ruby-mode-hook 'yard-mode)
    (add-hook 'ruby-mode-hook 'rspec-mode)
    (add-hook 'ruby-mode-hook 'ggtags-mode)
    (add-hook 'ruby-mode-hook 'rbenv-use-corresponding)
    (add-hook 'ruby-mode-hook
              '(lambda ()
                 (setq flycheck-checker 'ruby-rubocop)
                 (flycheck-mode 1)))

    (setq ruby-deep-indent-paren nil))
  :bind (("C-M-h" . backward-kill-word))
  :mode (("\\.rake$" . ruby-mode)
         ("\\.gemspec$" . ruby-mode)
         ("\\.ru$" . ruby-mode)
         ("Rakefile$" . ruby-mode)
         ("Thorfile$" . ruby-mode)
         ("Gemfile$" . ruby-mode)
         ("Capfile$" . ruby-mode)
         ("Guardfile$" . ruby-mode)))

(provide '40-Ruby)
;;; 40-Ruby.el ends here
