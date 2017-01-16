; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

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

;; 括弧を強調表示
(show-paren-mode t)

;; IMEの設定
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)
;; 変換キーでIME ON
(define-key global-map [henkan]
  (lambda ()
    (interactive)
    (if current-input-method (deactivate-input-method))
    (toggle-input-method)))

;; 無変換キーでIME OFF
(define-key global-map [muhenkan]
  (lambda ()
    (interactive)
    (if current-input-method (deactivate-input-method))))

;; iedit
(global-set-key [?\C-;] 'iedit-mode)

(global-set-key "\C-xc" 'compile)
(setq-default indent-tabs-mode nil)

(display-time-mode 1)

;; skk
(setq default-input-method "japanese-skk")
