;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  -*- coding: utf-8-unix -*-
;;  Emacs 初期設定ファイル
;;    Masaki Waga <tsugarutamenobu@gmail.com>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Windows Only
;;Setting for Font;
(set-face-attribute 'default nil
        :family "osaka"
        :height 90)
(set-fontset-font "fontset-default"
        'japanese-jisx0208
        '("osaka" . "jisx0208-sjis"))

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

;;Emacsのコピーをクリップボードに
(cond (window-system
(setq x-select-enable-clipboard t)
)) 

;; ses-csv
(load-file "~/.emacs.d/ses-csv.el")

;; yatexの設定ファイルを読み込む
(load-file "~/.emacs.d/init4yatex.el")

;; haskell-modeの設定ファイルを読み込む
(load-file "~/.emacs.d/init4haskell-mode.el")

;; Proof General
(load-file "~/.emacs.d/ProofGeneral/generic/proof-site.el")

;; flymakeの設定ファイルを読み込む
(load-file "~/.emacs.d/init4flymake.el")

;; Jabberの設定ファイルを読み込む
;(load-file "~/.emacs.d/init4jabber.el")

;; rcircの設定ファイルを読み込む
(load-file "~/.emacs.d/init4rcirc.el")

;; gtags
;(load-file "~/.emacs.d/setting4gtags.el")


;; mediawiki-modeの設定ファイルを読み込む
(load-file "~/.emacs.d/init4mediawiki-mode.el")

;; gtags
;(load-file "~/.emacs.d/setting4gtags.el")

;; Evernote
(load-file "~/.emacs.d/setting4evernote.el")

;; elpa
(load-file "~/.emacs.d/init4elpa.el")

;; rosemacsの設定ファイルを読み込む
(load-file "~/.emacs.d/init4rosemacs.el")

;; magit
(add-to-list 'load-path "~/.emacs.d/magit")
(require 'magit)

;; Local Variables:
;; mode: emacs-lisp
;; End:
