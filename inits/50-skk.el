;;; 50-skk --- Configuration for DDSKK
;;; Commentary:

;;; Code:
(leaf ddskk
  :ensure t
  :init
  ;;; Add emoji dictionary
  (defvar skk-extra-jisyo-file-list '())
  (add-to-list 'skk-extra-jisyo-file-list '("~/.emacs.d/SKK-JISYO.emoji.utf8" . utf-8-unix))
  :config
  ;;; Set japanese-skk as the default input method of Emacs
  (setq default-input-method "japanese-skk")
  ;;; use [hiragana-katakana] to start kana
  (define-key global-map [hiragana-katakana] 'skk-toggle-kana)
  ;;; Preload SKK at the start up time
  (setq skk-preload t)
  (defvar skk-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO.L"))
(provide '50-skk)
;;; 50-skk.el ends here
