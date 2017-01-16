;;; local_settings --- local and confidential settings
;;; Commentary:

;; twittering-mode
(require 'twittering-mode)
(global-set-key "\C-xt" 'twittering-update-status-interactive)

(setq twittering-account-authorization 'authorized)
(setq twittering-oauth-access-token-alist
     '(("oauth_token" . "149926462-NHbjWHWQf0GbV0uT2TMXW2gu4ZNZYPB4jyzh2jqf")
	("oauth_token_secret" . "kIrp8G0FC2B5lpTAavKOOgz9sMmw3OkyuAduQbcmKPkvS")
	("user_id" . "149926462")
	("screen_name" . "MasWag")))

(add-hook 'twittering-mode-hook
           (lambda ()
             (mapc (lambda (pair)
                     (let ((key (car pair))
                           (func (cdr pair)))
                       (define-key twittering-mode-map
                         (read-kbd-macro key) func)))
                   '(("F" . twittering-favorite)
                     ("T" . twittering-native-retweet)
                     ("I" . (lambda ()
                              (twittering-visit-timeline "qnighy/is2014")))))))

(setq twittering-icon-mode t)
(setq twittering-url-show-status nil)

(twittering-update-status-format 
'"%i %S, %@:
%FILL[  ]{%T %r%R}
")

(provide 'local_settings)
;;; local_settings.el ends here
