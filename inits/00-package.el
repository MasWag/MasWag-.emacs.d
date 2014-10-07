(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
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
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
