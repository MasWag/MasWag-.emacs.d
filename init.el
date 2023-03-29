;; Taken from: https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg
;; overriding image.el function image-type-available-p
(defun image-type-available-p (type)
  "Return t if image type TYPE is available.
Image types are symbols like `xbm' or `jpeg'."
  (if (eq 'svg type)
      nil
    (and (fboundp 'init-image-library)
         (init-image-library type))))
(require 'package)
;;;; Add package-archives
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;; Initialize
(package-initialize)
;; Locale setting
(set-locale-environment "ja_JP.UTF-8")
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(setenv "LANG" "en_US.UTF-8")
;; Time format
;; Let the system-time-locale to be "C"
(setq system-time-locale "C")
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;; Configuration of the background color
(when window-system
  (custom-set-faces
   '(default ((t
               (:background "#000040" :foreground "#e0e0e0")
               )))
   '(cursor ((((class color)
               (background dark))
              (:background "#00AA00"))
             (((class color)
               (background light))
              (:background "#999999"))
             (t ())
             ))))
;; Transparent background
(when window-system
  (add-to-list 'default-frame-alist '(alpha . (0.80 0.80))))
;; Use VL Gothic
(when window-system
  (add-to-list 'default-frame-alist '(font . "VL Gothic-15")))
;; Disable the toolbar
(when window-system
  (tool-bar-mode -1))
;; Use C-h as backspace
(global-set-key (kbd "C-h") 'delete-backward-char)
;; highlight the parentheses
(show-paren-mode 1)
;; Display the current time in the mode line
(display-time-mode 1)
;; Enable Emacs as a server
(require 'server)
(unless (server-running-p)
  (server-start))
;; add /usr/local/bin to PATH if not
(if (not (string-match "\\(^\\|:\\)/usr/local/bin\\($\\|\\:\\)" 
                       (getenv "PATH")))
    (setenv "PATH" (concat '"/usr/local/bin:" 
                           (getenv "PATH"))))
;; add /usr/local/bin to exec-path if not
(if (not (member "/usr/local/bin" exec-path))
    (setq exec-path (append '("/usr/local/bin") exec-path)))
;; Toggle IM
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)
;; Activate IM
(define-key global-map [henkan]
  (lambda ()
    (interactive)
    (if current-input-method (deactivate-input-method))
    (toggle-input-method)))
;; Deactivate IM
(define-key global-map [muhenkan]
  (lambda ()
    (interactive)
    (if current-input-method (deactivate-input-method))))
(require 'leaf)
(leaf leaf-keywords
      :ensure t
      :init
      (leaf hydra :ensure t)
      (leaf el-get :ensure t)
      (leaf blackout :ensure t)

      :config
      ;; initialize leaf-keywords.el
      (leaf-keywords-init))

(leaf leaf
      :config
      (leaf leaf-convert :ensure t)
      (leaf leaf-tree
            :ensure t
            :custom ((imenu-list-size . 30)
                     (imenu-list-position . 'left))))

(leaf macrostep
      :ensure t
      :bind (("C-c e" . macrostep-expand)))
;; Tabs and indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(leaf iedit
  :ensure t
  :bind (("C-;" . iedit-mode)
         ;; Use C-h as delete-backward-char also in iedit-mode
         (:iedit-mode-keymap
          ("C-h" . delete-backward-char))))
(leaf ace-jump-mode
  :ensure t
  :bind (("C-c j" . ace-jump-mode)))
(leaf ace-window
  :ensure t
  :custom
  (aw-keys . '(?j ?k ?l ?i ?o ?h ?y ?u ?p))
  :bind (("C-c w" . ace-window))
  :custom-face
  (aw-leading-char-face .
                        '((t (:height 4.0 :foreground "#f1fa8c")))))
(leaf ddskk
  :ensure t
  :init
  ;; Add emoji dictionary
  (defvar skk-extra-jisyo-file-list '())
  (add-to-list 'skk-extra-jisyo-file-list '("~/.emacs.d/SKK-JISYO.emoji.utf8" . utf-8-unix))
  :config
  ;; use [hiragana-katakana] to start kana
  (define-key global-map [hiragana-katakana] 'skk-toggle-kana)
  (setq skk-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO.L")
  :custom
  ;; Set japanese-skk as the default input method of Emacs
  (default-input-method . "japanese-skk")
  ;; Preload SKK at the start up time
  (skk-preload . t))
(leaf vertico
  :ensure t
  :init
  (vertico-mode)
  ;; Use savehist-mode to persist history
  (leaf savehist
    (savehist-mode))
  :bind ((vertico-map
          ;; I use C-l to delete word
          ("C-l" . vertico-directory-delete-word))))
;; Example configuration for Consult
(leaf consult
  :ensure t
  ;; Replace bindings. Lazily loaded due by `leaf.
  :bind (;; C-c c bindings (mode-specific-map)
         ("C-c c M-x" . consult-mode-command)
         ("C-c c h" . consult-history)
         ("C-c c k" . consult-kmacro)
         ("C-c c m" . consult-man)
         ("C-c c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         (isearch-mode-map
          ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
          ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
          ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
          ("M-s L" . consult-line-multi))            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         (minibuffer-local-map
          ("M-s" . consult-history)                 ;; orig. next-matching-history-element
          ("M-r" . consult-history)))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 3. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  ;;;; 4. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 5. No project support
  ;; (setq consult-project-function nil)
  )
;; Enable rich annotations using the Marginalia package
(leaf marginalia
  :ensure t
  ;; Either bind `marginalia-cycle' globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         (minibuffer-local-map
         ("M-A" . marginalia-cycle)))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))
(leaf orderless
  :ensure t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles partial-completion)))))
(leaf embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("M-C-;" . embark-dwim)        ;; good alternative: M-.
   ;; ("C-h B" . embark-bindings)
   ) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(leaf embark-consult
  :ensure t
  :hook)
(leaf company
  :ensure t
  :require
  :bind (:company-active-map
         ;; Use C-n and C-p to move
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ;; Use C-s to search
         ("C-s" . company-search-candidates)
         ;; Use C-i or <TAB> for completing
         ("C-i" . company-complete-selection)
         ("C-i" . (kbd "<tab>")))
  :bind (:company-search-map
         ;; Use C-n and C-p to move
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :hook (after-init-hook . global-company-mode)
  :config
  ;;; Color
  (set-face-attribute 'company-tooltip nil
                      :foreground "black" 
                      :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
                      :foreground "black" 
                      :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
                      :foreground "white"
                      :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
                      :foreground "black"
                      :background "steelblue")
  (set-face-attribute 'company-preview-common nil
                      :background nil 
                      :foreground "lightgrey" 
                      :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background "gray40")
  (leaf company-tabnine
    :ensure t
    :config
    ;; We use TabNine for advanced completion. TabNine can be installed with M-x company-tabnine-install-binary
    (add-to-list 'company-backends #'company-tabnine))
  :custom
  (company-idle-delay . 0)
  (company-minimum-prefix-length . 1)
  (global-company-mode . t)
  (company-selection-wrap-around . t) 
  ;; Show quick help
  (company-quickhelp-mode . t))
;; Configure yasnippet
(leaf yasnippet
  :ensure t
  :custom
  (yas-global-mode . t)
  :config
  ;; I install yasnippet-snippets to get the default snippets
  (leaf yasnippet-snippets
    :ensure t))
(leaf magit
  :ensure t
  :init
  (leaf magit-gitflow
    :ensure t)
  ;; We use C-x g to open magit
  :bind (("C-x g" . magit-status))
  :hook
  ((magit-mode-hook . turn-on-magit-gitflow)))
(leaf git-modes
  :ensure t)
;; Load the smtpmail package
(leaf smtpmail
  :config
  ;; Set your email credentials
  (setq user-mail-address "mwaga@fos.kuis.kyoto-u.ac.jp"
        user-full-name "Masaki Waga")
  ;; Configure the SMTP server
  ;; (setq smtpmail-smtp-server "io.kuis.kyoto-u.ac.jp"
  ;;       smtpmail-smtp-service "25")
  (setq smtpmail-smtp-server "localhost"
        smtpmail-smtp-service "2525"))
(leaf notmuch
  :custom
  (notmuch-fcc-dirs . "lab8/Sent/Inbox/")
  (message-send-mail-function . 'message-smtpmail-send-it)
  ;; (message-send-mail-function . 'message-send-mail-with-sendmail)
  ;; postponed message is put in the following draft directory
  (message-auto-save-directory . "~/Maildir/drafts/")
  (message-kill-buffer-on-exit . t)
  ;;  New message should come first
  (notmuch-search-oldest-first . nil)
  (notmuch-saved-searches
   .
   '((:name "inbox"   :query "tag:inbox not tag:trash" :key "i")
     (:name "flagged" :query "tag:flagged"             :key "f")
     (:name "unread"  :query "tag:unread"              :key "u")
     (:name "sent"    :query "tag:sent"                :key "s")
     (:name "drafts"  :query "tag:draft"               :key "d")))
  :bind (
         ;; Use C-c m n to open notmuch
         ("C-c m n" . notmuch)
         (:notmuch-show-mode-map
          ("n" . notmuch-show-next-thread-show)
          ("p" . notmuch-show-previous-thread-show)))
  :ensure t)
(leaf consult-notmuch
  :ensure t
  ;; We invoke consult-notmuch with M-s (search) n (notmuch)
  :bind ("M-s n" . consult-notmuch)
  :custom
  ;; I prefer showing the entire thread
  (consult-notmuch-show-single-message . nil))
(leaf mastodon
  :ensure t
  :init
  (leaf emojify
    :ensure t)
  ;; Use C-c m m to open mastodon
  :bind ("C-c m m" . mastodon)
  :custom
  ;; I use mstdn.jp
  (mastodon-instance-url . "https://mstdn.jp")
  (mastodon-active-user . "MasWag"))
(leaf org
  :custom
  ;; I put the org-mode files under ~/wiki
  (org-directory . "~/wiki")
  ;; The default note is nots.org
  (org-default-notes-file . "notes.org")
  :bind
  (("C-c n n" . org-capture)
   ("C-c n a" . org-agenda)
   (org-mode-map 
    ("C-c l" . org-store-link)
    ("C-c g" . org-mark-ring-goto)))
  ;; :bind
  ;; Use M-s s to search from the org-directory
  ;; ("M-s s" .
  ;;  (lambda ()
  ;;    (interactive)
  ;;    (consult-ripgrep org-directory)))
  )
(leaf ol-notmuch
  :init
  (defun ol-notmuch-kill-new ()
    (interactive)
    (kill-new
     (concat "notmuch:id:"
             (notmuch-show-get-message-id t))))
  :bind ((:notmuch-show-mode-map
         ;; We add the current mail to kill-ring with C-c l
         ("C-c l" . ol-notmuch-kill-new)))
  :ensure t)
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/wiki/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ("r" "Research Note" entry (file+headline "~/wiki/Research/research_notes.org" "Research Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ("k" "研究会" entry (file+headline "~/wiki/Research/research_notes.org" "研究会")
         "* %?\nEntered on %U\n %i\n %a")
        ("d" "ActiveDTALearning" entry (file+headline "~/wiki/Research/ActiveDTALearning.org" "Notes")
         "** %?\nEntered on %U\n %i\n %a"
         :prepend t)
        ("h" "HALearning" entry (file+headline "~/wiki/Research/HALearning.org" "Notes")
         "** %?\nEntered on %U\n %i\n %a"
         :prepend t)
        ("m" "MQTT Monitoring" entry (file+headline "~/wiki/Research/mqtt_monitoring.org" "Notes")
         "** %?\nEntered on %U\n %i\n %a"
         :prepend t)
        ("b" "Bookmark" entry (file+headline "~/wiki/Bookmark.org" "InBox")
         "** %?\nEntered on %U\n %i\n %a")
        ("t" "Tools" entry (file+olp "~/wiki/notes.org" "Nice Tools" "InBox")
         "** %?\nEntered on %U\n %i\n %a")
        ("w" "Weely Review" entry (file "~/wiki/Research/weekly_review.org")
         "* %?\nEntered on %U" )
        ("l" "Blog Entry" entry (file+headline "~/blog/blog.org" "Blog Entries")
         "* TODO %? %^g\n:PROPERTIES:\n:EXPORT_FILE_NAME: \n:EXPORT_HUGO_SECTION: posts/%<%y>/%<%m>\n:EXPORT_DATE: %u\n:END:" :prepend t)
        ("L" "Lecures" entry (file+headline "~/Google Drive File Stream/My Drive/Lectures.org" "InBox")
         "** %?\nEntered on %U\n %i\n %a")))
(setq org-agenda-files '("~/wiki/Research/" "~/wiki/" "~/parametric_HA_monitor/meeting_note.txt"))
(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 3))))
(leaf org-noter
  :ensure t
  ;; I like having the PDF file and the note in different frame
  :custom (org-noter-notes-window-location . 'other-frame)
  :config
  (leaf org-noter-pdftools
    :require t
    :ensure t)
  (leaf org-pdftools
    :require t
    :ensure t)
  (pdf-tools-install)
  :hook (org-mode . org-pdftools-setup-link))
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(leaf markdown-mode
  :ensure t)
(leaf yatex
  ;; If YaTeX is not installed, use package.el to install it
  :ensure t
  ;; :commands Specify commands to autoload
  :commands yatex-mode
  ;; :mode auto-mode-alist setting
  :mode (("\\.tex\\'"
          "\\.ltx\\'" 
          "\\.cls\\'" 
          "\\.sty\\'" 
          "\\.clo\\'" 
          "\\.bbl\\'") . yatex-mode)
  :init
  (setq YaTeX-inhibit-prefix-letter t)
  ;; The :config keyword describes settings after loading the library.
  :config
  (setq YaTeX-kanji-code nil)
  (setq YaTeX-latex-message-code 'utf-8)
  (setq YaTeX-use-LaTeX2e t)
  (setq YaTeX-use-AMS-LaTeX t)
  (cond ((equal system-type 'darwin)
         (setq tex-command
               "/Library/TeX/texbin/latexmk -pvc -view=none")
         (setq tex-dvi-view-command
               "/usr/bin/open -a Skim")
         (setq tex-pdfview-command
               "/usr/bin/open -a Skim"))
        ((equal system-type 'gnu/linux)
         (setq tex-command
               "/usr/bin/latexmk -pvc -view=none")
       (setq tex-dvi-view-command "/usr/bin/evince"
             dvi2-command "/usr/bin/evince"
             tex-pdfview-command "/usr/bin/evince")))
  (auto-fill-mode 0))
(leaf reftex
  :hook (yatex-mode . reftex-mode)
  :bind (reftex-mode-map
              ("C-c (" . reftex-reference)
              ("C-c )" . nil)
              ("C-c >" . YaTeX-comment-region)
              ("C-c <" . YaTeX-uncomment-region))
  :custom
  ;; Use \cref instead of \ref
  (reftex-ref-style-default-list . '("Cleveref")))
(package-install 'biblio)
(leaf ispell
  :init
      ;;; Use aspell as a spell checker
  (cond ((equal system-type 'darwin)
         (setq ispell-program-name
               "/usr/local/bin/aspell"))
        ((equal system-type 'gnu/linux)
         (setq ispell-program-name
               "/usr/bin/aspell")))
  :config
  ;; Skip the Japanese part.
  (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(leaf flyspell
  ;; Install flyspell
  :ensure t
  ;; Use flyspell in YaTeX mode
  :hook (yatex-mode-hook org-mode-hook markdown-mode-hook)
  ;; We assign C-; to iedit-mode
  :bind
  ((flyspell-mode-map
    ("C-;")))
  :config
  ;; Use flyspell-correct to improve the UI
  (leaf flyspell-correct
    :bind ((flyspell-mode-map
           ;; We use flyspell-correct-wrapper instead of flyspell-correct-word-before-point
           ("C-c $" . flyspell-correct-wrapper)))
    :ensure t))
(leaf flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :config
  (flycheck-add-mode 'tex-chktex 'yatex-mode)
  (flycheck-add-mode 'tex-lacheck 'yatex-mode)
  ;; If chktex is not found automatically, specify as follows, and the same for lacheck
  :custom
  (flycheck-tex-chktex-executable . "/Library/TeX/texbin/chktex")
  :bind (flycheck-mode-map
            ("M-n" . flycheck-next-error)
            ("M-p" . flycheck-previous-error)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck flyspell biblio yatex markdown-mode org-noter ol-notmuch emojify mastodon consult-notmuch notmuch git-modes magit-gitflow magit yasnippet-snippets yasnippet company-tabnine company embark-consult embark orderless marginalia consult vertico ddskk ace-window ace-jump-mode iedit macrostep leaf-tree leaf-convert blackout el-get hydra leaf-keywords)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#000040" :foreground "#e0e0e0"))))
 '(aw-leading-char-face ((t (:height 4.0 :foreground "#f1fa8c"))) nil "Customized with leaf in `ace-window' block at `/Users/calros/.emacs.d/init.el'")
 '(cursor ((((class color) (background dark)) (:background "#00AA00")) (((class color) (background light)) (:background "#999999")) (t nil))))
