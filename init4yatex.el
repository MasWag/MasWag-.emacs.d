;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Setting for YaTeX
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path (cons (expand-file-name "~/.emacs.d/yatex") load-path))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-use-AMS-LaTeX t)
(setq dviprint-command-format "lpr %s")
;(setq dvi2-command "pxdvi -expert -watchfile 1")
(setq YaTeX-kanji-code nil)

;; Settings for LuaLaTeX
(setq tex-command "lualatex -synctex=1")
(setq dvi2-command "evince")
(setq tex-pdfview-command "evince")

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons (cons "\\.htm$" 'yahtml-mode) auto-mode-alist))
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
