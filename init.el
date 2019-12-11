(require 'cl)
(require 'package)

;; Add package-archives
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
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
 '(org-agenda-files
   (quote
    ("/Users/calros/wiki/Research/Talks.org" "/Users/calros/wiki/Research/Automata-Based_Monitoring_with_Freezing_Operators.org" "/Users/calros/wiki/Research/DataMonitor.org" "/Users/calros/wiki/Research/DistributedFilter4PM.org" "/Users/calros/wiki/Research/Falsification_of_CPS_via_Automata_Learning.org" "/Users/calros/wiki/Research/MitsubishiMonitoring.org" "/Users/calros/wiki/Research/OnlineQuantitativeTimedPatternMatching.org" "/Users/calros/wiki/Research/RNN2WFA.org" "/Users/calros/wiki/Research/ResearchIdeas.org" "/Users/calros/wiki/Research/Reviews.org" "/Users/calros/wiki/Research/RobBBC.org" "/Users/calros/wiki/Research/cyveria.org" "/Users/calros/wiki/Research/demo_link.org" "/Users/calros/wiki/Research/largest_mutation_problem.org" "/Users/calros/wiki/Research/research_notes.org" "/Users/calros/wiki/Research/seasonaly_review.org" "/Users/calros/wiki/Research/weekly_review.org" "/Users/calros/wiki/Getting Started with Orgzly.org" "/Users/calros/wiki/keiko.org" "/Users/calros/wiki/mobile_notes.org" "/Users/calros/wiki/notes.org" "/Users/calros/wiki/pairs.org" "/Users/calros/wiki/the_art_of_war.org")) t)
 '(package-selected-packages
   (quote
    (w3m pandoc-mode company-ansible company-bibtex company-shell company-lsp spinner lsp-haskell lsp-mode lsp-ui company-ghc mmm-mode ein-mumamo todoist biblio ace-window company-irony-c-header ace-jump-mode irony-eldoc gnuplot-mode flycheck-mypy ein yasnippet-snippets graphviz-dot-mode slack flymd cmake-ide cmake-mode bison-mode dockerfile-mode wolfram-mode yatex yaml-mode web-mode typescript-mode multi-term markdown-mode magit-svn magit-gitflow init-loader iedit helm-ag haskell-snippets haml-mode ghc ggtags flyspell-correct-helm flycheck-haskell ddskk ag ac-js2 ac-haskell-process)))
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
  (cond ((equal (system-name) "Masakis-MacBook-Pro.local")
         (setq satysfi-pdf-viewer-command "open -a Skim")
         (setq satysfi-command "/Users/calros/bin/satysfi")
         )
        ((equal (system-name) "reimu")
         (setq satysfi-pdf-viewer-command "evince")
         (setq satysfi-command "satysfi")
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
       (setq flycheck-satysfi-type-executable "/Users/calros/bin/satysfi")
       )
      ((equal (system-name) "reimu")
       (setq flycheck-satysfi-type-executable "/home/calros/.opam/4.06.0/bin/satysfi")
       ))

(add-to-list 'flycheck-checkers 'satysfi-type)
