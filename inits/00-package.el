(setq installing-package-list
  '(
    ;; Common
    company
    markdown-mode
    pandoc-mode
    helm
    magit
    ggtags
    flycheck
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
    ace-jump-mode
    ace-window
    biblio
    ;; lsp-mode
    lsp-mode
    lsp-ui
    ;; Org-mode
    uimage
    ;; C++
    irony
    flycheck-irony
    rtags
    cmake-mode
    company-irony
    company-irony-c-headers
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
    ;; Jupyter Notebook
    ein
    ;; Haskell
    haskell-mode
    flycheck-haskell
    lsp-haskell
    ;; RDF
    ttl-mode
    ;; TerraForm
    company-terraform
    terraform-doc
    terraform-mode
    ))

(require 'cl)
(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
