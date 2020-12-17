;;; 50-skk --- Configuration for ddskk
;;; Commentary:

;;; Code:
(setq default-input-method "japanese-skk")
(define-key global-map [hiragana-katakana] 'skk-toggle-kana)
(setq skk-preload t)
(setq skk-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO.L")
;;; 50-skk.el ends here
