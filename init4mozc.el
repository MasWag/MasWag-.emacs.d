(require 'mozc)
(setq default-input-method "japanese-mozc")
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)
;; 変換キーでIME ON
(define-key global-map [M-henkan]
  (lambda ()
    (interactive)
    (if current-input-method (inactivate-input-method))
    (toggle-input-method)))

;; 無変換キーでIME OFF
(define-key global-map [muhenkan]
  (lambda ()
    (interactive)
    (inactivate-input-method)))
