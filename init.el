;;背景色の設定
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
(t ())
)))

;; C-x cでM-x compileになる
(global-set-key "\C-xc" 'compile)
 
;; C-h でbackspaceにする
(global-set-key "\C-h" 'delete-backward-char)


;; yatexの設定ファイルを読み込む
(load-file "~/.emacs.d/init4yatex.el")

;; haskell-modeの設定ファイルを読み込む
(load-file "~/.emacs.d/init4haskell-mode.el")