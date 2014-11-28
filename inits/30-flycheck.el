(add-hook 'c++-mode-hook
	  (lambda () (setq flycheck-clang-language-standard "c++11")))

 	
;; (add-hook 'flycheck-mode-hook
;;           '(lambda ()
;;              (define-key flycheck-mode-map "\M-p" 'flycheck-previous-error)
;;              (define-key flycheck-mode-map "\M-n" 'flycheck-next-error)))

