(require 'twittering-mode)
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
		    ("R" . twittering-replies-timeline)
		    ("U" . twittering-user-timeline)
		    ("T" . twittering-retweet)
		    ("W" . twittering-update-status-interactive)))))
