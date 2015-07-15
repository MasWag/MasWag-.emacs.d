(defvar installing-package-list
  '(
    auto-complete
    helm
    magit
    ggtags
    flycheck
    yasnippet
    ddskk
    iedit
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
