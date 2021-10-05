(require 'package)

(setenv "LANG" "en_US.UTF-8")

(setq package-archives nil)

;; Add package-archives
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("nongnu-elpa" . "https://elpa.nongnu.org/nongnu/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Initialize
(package-initialize)

;; init-loader
(require 'init-loader)
(init-loader-load)

;; site-lisp
(setq load-path (cons (expand-file-name "~/.emacs.d/site-lisp") load-path))

;; use custom.el
(setq custom-file (locate-user-emacs-file "custom.el"))


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
    (avy-migemo org-tree-slide z3-mode gitconfig-mode gitignore-mode json-mode ob-async company-terraform terraform-doc terraform-mode w3m pandoc-mode company-ansible company-bibtex company-shell company-lsp spinner lsp-haskell lsp-mode lsp-ui company-ghc mmm-mode ein-mumamo todoist biblio ace-window company-irony-c-header ace-jump-mode irony-eldoc gnuplot-mode flycheck-mypy ein yasnippet-snippets graphviz-dot-mode slack flymd cmake-ide cmake-mode bison-mode dockerfile-mode wolfram-mode yatex yaml-mode web-mode typescript-mode multi-term markdown-mode magit-svn magit-gitflow init-loader iedit helm-ag haskell-snippets haml-mode ghc ggtags flyspell-correct-helm flycheck-haskell ddskk ag ac-js2 ac-haskell-process)))
 '(safe-local-variable-values
   (quote
    ((irony-additional-clang-options . "-std=c++14")
     (eval setq flycheck-python-mypy-ini
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
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
