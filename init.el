(require 'cl)
(require 'package)

;; Add package-archives
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Initialize
(package-initialize)

;; init-loader
(require 'init-loader)
(init-loader-load)

;; site-lisp
(setq load-path (cons (expand-file-name "~/.emacs.d/site-lisp") load-path))

(load-file "~/.emacs.d/local_settings.el")

;; yatexの設定ファイルを読み込む
;;(load-file "~/.emacs.d/init4yatex.el")

;; (require 'langtool)
;; (setq langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*")
;;(setq langtool-language-tool-jar "/usr/share/java/languagetool/languagetool-commandline.jar")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" default)))
 '(display-time-mode t)
 '(graphviz-dot-view-command "dot -Tpng %s -O")
 '(irony-additional-clang-options (quote ("-std=c++14")))
 '(package-selected-packages
   (quote
    (biblio ace-window company-irony-c-header ace-jump-mode irony-eldoc gnuplot-mode flycheck-mypy ein yasnippet-snippets graphviz-dot-mode slack flymd cmake-ide cmake-mode bison-mode dockerfile-mode wolfram-mode yatex yaml-mode web-mode typescript-mode multi-term markdown-mode magit-svn magit-gitflow init-loader iedit helm-ag haskell-snippets haml-mode ghc ggtags flyspell-correct-helm flycheck-haskell ddskk ag ac-js2 ac-ispell ac-haskell-process)))
 '(safe-local-variable-values
   (quote
    ((eval setq flycheck-python-mypy-ini
           (concat default-directory "mypy.ini"))
     (flycheck-python-mypy-ini concat default-directory "mypy.ini"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#000040" :foreground "#e0e0e0"))))
 '(aw-leading-char-face ((t (:height 4.0 :foreground "#f1fa8c"))))
 '(cursor ((((class color) (background dark)) (:background "#00AA00")) (((class color) (background light)) (:background "#999999")) (t nil))))

(cond ((equal (system-name) "Masakis-MacBook-Pro.local")
       ;; shell
       (setq shell-file-name "/usr/local/bin/bash")
       ))

;; satysfi
(require 'use-package)
(use-package satysfi
  :mode (("\\.saty$" . satysfi-mode)
         ("\\.satyh$" . satysfi-mode))
  :config
  (setq satysfi-command "satysfi")
  (cond ((equal (system-name) "Masakis-MacBook-Pro.local")
         (setq satysfi-pdf-viewer-command "open -a Skim")
         )
        ((equal (system-name) "reimu")
         (setq satysfi-pdf-viewer-command "evince")
         )))

(require 'flycheck)

(flycheck-define-checker satysfi-type
  "A SATySFi type checker"
  :command ("satysfi" "-t" source-inplace)
  :error-patterns
  ((error line-start
          "! [" (one-or-more not-newline) "] at \"" (file-name) "\", line " line ", characters " (one-or-more not-newline) "-"column (one-or-more not-newline) "\n"
          (message (one-or-more not-newline)
                   (zero-or-more "\n" (any " ") (one-or-more not-newline))) "." line-end))
  :modes (satysfi-mode))

(cond ((equal (system-name) "Masakis-MacBook-Pro.local")
       (setq flycheck-satysfi-type-executable "/usr/local/bin/satysfi")
       )
      ((equal (system-name) "reimu")
       (setq flycheck-satysfi-type-executable "/home/calros/.opam/4.06.0/bin/satysfi")
       ))

(add-to-list 'flycheck-checkers 'satysfi-type)
