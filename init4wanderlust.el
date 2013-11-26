(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
;HTMLメールを読めるようにする
(require 'mime-w3m)
;日本語infoを読めるようにする
(auto-compression-mode t)
;メールドラフトモードをWandarlustドラフトモードに
(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))
;w3mでグラフィック表示を有効にする
(setq w3m-default-display-inline-images t)
