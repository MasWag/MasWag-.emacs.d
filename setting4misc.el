;; C-x cでM-x compileになる
(global-set-key "\C-xc" 'compile)
 
;; C-h でbackspaceにする
(global-set-key "\C-h" 'delete-backward-char)

;;Emacsのコピーをクリップボードに
(cond (window-system
(setq x-select-enable-clipboard t)
)) 
