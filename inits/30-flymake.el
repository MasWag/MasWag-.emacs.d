;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Setting for flymake
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flymake)
 
(defun flymake-cc-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
  (list "g++" (list "-std=c++11" "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
 
;; Minibuf に出力
(defun flymake-display-err-minibuf-for-current-line ()
"Displays the error/warning for the current line in the minibuffer"
(interactive)
(let* ((line-no (flymake-current-line-no))
(line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
(count (length line-err-info-list)))
(while (> count 0)
(when line-err-info-list
(let* ((text (flymake-ler-text (nth (1- count) line-err-info-list)))
(line (flymake-ler-line (nth (1- count) line-err-info-list))))
(message "[%s] %s" line text)))
(setq count (1- count)))))
 
;; M-p/M-n で警告/エラー行の移動
(global-set-key "\M-p" 'flymake-goto-prev-error)
(global-set-key "\M-n" 'flymake-goto-next-error)
(global-set-key "\M-?" 'flymake-display-err-minibuf-for-current-line)
 
(add-hook 'c++-mode-hook
'(lambda ()
(flymake-mode t)))
 
(add-hook 'c-mode-hook
'(lambda ()
(flymake-mode t)))


;; setting for ocaml
(defun flymake-ocaml-init ()
  (flymake-simple-make-init-impl
   'flymake-create-temp-with-folder-structure nil nil
   (file-name-nondirectory buffer-file-name)
   'flymake-get-ocaml-cmdline))
(defun flymake-get-ocaml-cmdline (source base-dir)
  (list "ocaml_flycheck.pl"
	(list source base-dir)))

(push '(".+\\.ml[yilp]?$" flymake-ocaml-init flymake-simple-java-cleanup)
      flymake-allowed-file-name-masks)
(push
 '("^\\(\.+\.ml[yilp]?\\|\.lhs\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)"
   1 2 3 4) flymake-err-line-patterns)

;; optional setting
;; if you want to use flymake always, then add the following hook.
;; (add-hook
;;  'tuareg-mode-hook
;;  '(lambda ()
;;     (if (not (null buffer-file-name)) (flymake-mode))))
