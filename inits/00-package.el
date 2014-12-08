(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    auto-complete
    auto-complete-c-headers
    multi-term
    helm
    c-eldoc
    auto-complete-clang-async
    magit
    helm-gtags
    helm-ag
    ggtags
    markdown-mode
    skype
    tuareg
    iedit
    yasnippet
    auto-yasnippet
    cedit
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
