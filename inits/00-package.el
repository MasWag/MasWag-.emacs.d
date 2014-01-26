(require 'cl)

(defvar installing-package-list
  '(
    ;; �����˻ȤäƤ���ѥå�������񤯡�
    helm
    c-eldoc
    magit
    helm-gtags
    ggtags
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
