(defvar installing-package-list
  '(
    ;; Common
    company
    markdown-mode
    helm
    magit
    ggtags
    flycheck
    haskell-mode
    flycheck-haskell
    yasnippet
    ddskk
    iedit
    multi-term
    haskell-mode
    yatex
    flyspell-correct-helm
    magit-gitflow
    use-package
    matlab-mode
    ;; C++
    irony
    flycheck-irony
    rtags
    cmake-mode
    company-irony
    company-irony-c-header
    irony-eldoc
;    company-c-headers
;    cmake-ide
    ;; For Cloud LaTeX
;    web-mode
    ;;; TypeScript
;    typescript-mode
;    tide
    ;;; Rails
;    ruby-mode
;    ruby-electric
;    rinari
;    rhtml-mode
;    ruby-tools
;    rbenv
;    rspec-mode
;    robe
;    enh-ruby-mode
    ;; Rust
    rust-mode
    flycheck-rust
    racer
    company-racer
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
