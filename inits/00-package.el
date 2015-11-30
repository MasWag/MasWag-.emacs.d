(defvar installing-package-list
  '(
    auto-complete
    markdown-mode
    helm
    magit
    ggtags
    flycheck
    yasnippet
    ddskk
    iedit
    multi-term
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
