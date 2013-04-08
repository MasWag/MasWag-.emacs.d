;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Jabber
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/jabber")
(require 'jabber)
(setq jabber-account-list
      '(("foo@gmail.com"
  (:network-server . "talk.google.com")
  (:connection-type . ssl))))