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

;; use custom.el
(setq custom-file (locate-user-emacs-file "custom.el"))


(load-file "~/.emacs.d/local_settings.el")

;; yatexの設定ファイルを読み込む
;;(load-file "~/.emacs.d/init4yatex.el")

;; (require 'langtool)
;; (setq langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*")
;;(setq langtool-language-tool-jar "/usr/share/java/languagetool/languagetool-commandline.jar")

(cond ((equal (system-name) "Masakis-MacBook-Pro.local")
       ;; shell
       (setq shell-file-name "/usr/local/bin/bash")
       ))
