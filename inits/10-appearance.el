;; server start for emacs-client
(leaf server
  :ensure t
  :init
  (server-mode 1)
  :require t
  :config
  (unless (server-running-p)
    (server-start)))

;; add /usr/local/bin to PATH if not
(if (not (string-match "\\(^\\|:\\)/usr/local/bin\\($\\|\\:\\)" (getenv "PATH")))
    (setenv "PATH" (concat '"/usr/local/bin:" (getenv "PATH"))))

(if (not (getenv "XAPIAN_CJK_NGRAM"))
    (setenv "XAPIAN_CJK_NGRAM" "1"))

;; the same thing for exec-path
(if (not (member "/usr/local/bin" exec-path))
    (setq exec-path (cons "/usr/local/bin" exec-path)))
;; References
; - https://flex.phys.tohoku.ac.jp/texi/eljman/eljman_220.html
; - https://flex.phys.tohoku.ac.jp/texi/eljman/eljman_60.html
; - https://ayatakesi.github.io/emacs/24.5/elisp_html/Sets-And-Lists.html

;;背景色の設定
(when window-system
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
(add-to-list 'default-frame-alist '(alpha . (0.80 0.80)))
;; Use VL Gothic on Linux
(when (equal system-type 'gnu/linux)
  (add-to-list 'default-frame-alist '("-VL  -VL ゴシック-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")))
;; tool-barを消す
(tool-bar-mode 0)

;; C-h でbackspaceにする
(global-set-key "\C-h" 'delete-backward-char)

;; 括弧を強調表示
(show-paren-mode 1)

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
(leaf iedit
  :ensure t
  :bind (([67108923] . iedit-mode)))
;; (global-set-key [?\C-;] 'iedit-mode)


(global-set-key "\C-xc" 'compile)
(setq-default indent-tabs-mode nil)

(display-time-mode 1)

;; skk
(setq default-input-method "japanese-skk")
