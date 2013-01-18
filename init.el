;;Setting for Font;
;(set-face-attribute 'default nil
;        :family "osaka"
;        :height 90)
;(set-fontset-font "fontset-default"
;        'japanese-jisx0208
;        '("osaka" . "jisx0208-sjis"))


;;;;;;Setting for YaTeX;;;
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;;îwåiêFÇÃê›íË
(custom-set-faces
'(default ((t
(:background "#000040" :foreground "#e0e0e0")
)))
'(cursor ((((class color)
(background dark))
(:background "#00AA00"))
(((class color)
(background light))
(:background "#999999"))
(t ()))))

 

;; C-x cÇ≈M-x compileÇ…Ç»ÇÈ
(global-set-key "\C-xc" 'compile)

 
;; C-h Ç≈backspaceÇ…Ç∑ÇÈ
(global-set-key "\C-h" 'delete-backward-char)