;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  -*- coding: utf-8-unix -*-
;;  Emacs 初期設定ファイル
;;    Masaki Waga <tsugarutamenobu@gmail.com>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq c-default-style "k&r"
      c-basic-offset 4)

(tool-bar-mode 0)

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

(add-to-list 'load-path "~/.emacs.d/")

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

;; markdown-modeの設定ファイルを読み込む
(load-file "~/.emacs.d/init4markdown-mode.el")

;; auto-completeの設定ファイルを読み込む
(load-file "~/.emacs.d/init4auto-complete.el")

;; mozc-el
(require 'mozc)
(setq default-input-method "japanese-mozc")
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)

(require 'w3m-load)

;; Local Variables:
;; mode: emacs-lisp
;; End:
