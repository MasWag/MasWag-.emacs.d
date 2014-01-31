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
;; tool-barを消す
(tool-bar-mode 0)
