(defvar installing-package-list
  '(
    auto-complete
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
    ac-ispell
    haskell-mode
    ac-haskell-process
    flycheck-haskell
    yatex
    flyspell-correct-helm
    magit-gitflow
    use-package
    matlab-mode
    ;; C++
    auto-complete-clang-async
    ;; For Cloud LaTeX
    web-mode
    ;;; TypeScript
    typescript-mode
    tide   
    ;;; Rails
    ruby-mode
    ruby-block
    ruby-electric
    rinari
    rhtml-mode
    ruby-tools
    rbenv
    rspec-mode
    robe
    enh-ruby-mode
    ;; Rust
    rust-mode
    flycheck-rust
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
