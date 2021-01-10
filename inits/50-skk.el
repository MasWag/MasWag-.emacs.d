;;; 50-skk --- Configuration for DDSKK
;;; Commentary:

;;; Code:
;;; Set japanese-skk as the default input method of Emacs
(setq default-input-method "japanese-skk")
;;; use [hiragana-katakana] to start kana
(define-key global-map [hiragana-katakana] 'skk-toggle-kana)
;;; Preload SKK at the start up time
(setq skk-preload t)
(setq skk-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO.L")
(provide '50-skk)
;;; 50-skk.el ends here
