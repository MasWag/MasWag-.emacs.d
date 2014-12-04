;;背景色の設定
( when window-system 
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
	     ))))
;; フレーム透過設定
(add-to-list 'default-frame-alist '(alpha . (0.75 0.75)))
;; tool-barを消す
(tool-bar-mode 0)

;; C-h でbackspaceにする
(global-set-key "\C-h" 'delete-backward-char)

;;Emacsのコピーをクリップボードに
(cond (window-system
       (setq x-select-enable-clipboard t)
       )) 

;;; iedit
(global-set-key [?\C-;] 'iedit-mode)
