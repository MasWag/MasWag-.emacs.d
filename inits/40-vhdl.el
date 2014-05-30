;; $HeadURL: https://tstotts.net/pubvc/elisp-snippets/set-flymake.el $
;; $Id: set-flymake.el 416 2007-01-13 17:28:06Z tas $

;; Authored by Timothy Stotts in 2006-2007.
;; This is free software distributed under the GPL Version 2 or newer.
;; It has no warranty. See the GNU General Public License for more
;; information.

;; This code is not part of GNU Emacs.

;; flymake for syntax checking

(require 'flymake)
(require 'vhdl-mode)

;; a few settings
(setq flymake-no-changes-timeout 1.0)
(setq flymake-start-syntax-check-on-newline nil)

;;
;; GHDL syntax checking for `vhdl-mode'
;;
(defun flymake-ghdl-init ()
  "This function implements syntax checking of `vhdl-mode' source with the
GHDL compiler. It inherits some of the `vhdl-mode' options, including
`vhdl-standard'."
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ghdl" (list "-s"
                       (cond ((and (vhdl-standard-p '93) (vhdl-standard-p '87)) "--std=93c")
                             ((vhdl-standard-p '93) "--std=93")
                             ((vhdl-standard-p '87) "--std=93c")
                             (t "--std=93c"))
                       "--no-vital-checks"
                       "-fexplicit"
                       "--ieee=synopsys"
                       local-file))))

;; for each regex listed in `auto-mode-alist' to enable `vhdl-mode',
;; also use that regex for `flymake-allowed-file-name-masks'.
(dolist (v auto-mode-alist)
  (when (eq (cdr v) 'vhdl-mode)
    (add-to-list 'flymake-allowed-file-name-masks '("\\.vhdl?\\'" flymake-ghdl-init))
    ))

;; the error line pattern for GHDL
(add-to-list 'flymake-err-line-patterns
             '("\\([^ \n]+\\):\\([0-9]+\\):\\([0-9]+\\): \\(.*\\)" 1 2 3 4))

(setq flymake-ghdl-excludes '(":[0-9]+:10: [^\n]+ not found in library .work"
                              ":[0-9]+:14: [^\n]+ was not analysed"
                              ":[0-9]+:[0-9]+: no declaration for [^\n]+"))
(defun flymake-ghdl-exclude (output)
  "Rewrites GHDL error patterns listed in `flymake-ghdl-excludes'
to a dummy error expressions. This function is only useful if somehow
hooked or advised into the flymake library."
  (setq q output)
  (let* ((idx (length flymake-ghdl-excludes))
         (c 0)
         (out output))
    (while (< c idx)
      (while (not (null (string-match (nth c flymake-ghdl-excludes) out)))
        (setq out (replace-match ":0:00: GHDLdummy" nil nil out)))
      (setq c (+ 1 c)))
    out))

(defadvice flymake-parse-output-and-residual (before ghdl-flymake-parse-output-and-residual activate)
  "Advises `flymake-parse-output-and-residual' to preprocess the checker output with `flymake-ghdl-exclude'."
  (ad-set-arg 0 (flymake-ghdl-exclude (ad-get-arg 0))))

(defadvice flymake-highlight-line (around ghdl-flymake-highlight-line activate)
  "Advises `flymake-highlight-line' to perform its highlighting function if and only if
the current error line is not a rewritten dummy error."
  (let* ((args (ad-get-args 0))
         (fstr (car (nth 1 args)))
         (line (flymake-ler-line fstr))
         (msg  (flymake-ler-text fstr))
         (dum  (and msg (not (null (string-match "GHDLdummy" msg))))))
    (unless (and dum (= 0 line))
      ad-do-it)))

(provide 'set-flymake)
