;;; 40-YaTeX ---  Setting for YaTeX
;;; Commentary:

;;; Code:

(use-package yatex
  ;; Install YaTeX if not installed
  :ensure t
  ;; :commands autoload するコマンドを指定
  :commands (yatex-mode)
  ;; :mode auto-mode-alist の設定
  :mode (("\\.tex$" . yatex-mode)
         ("\\.ltx$" . yatex-mode)
         ("\\.cls$" . yatex-mode)
         ("\\.sty$" . yatex-mode)
         ("\\.clo$" . yatex-mode)
         ("\\.bbl$" . yatex-mode))
  ;; :config キーワードはライブラリをロードした後の設定などを記述します。
  :init
  (setq YaTeX-inhibit-prefix-letter t)
  :config
  (setq YaTeX-kanji-code nil)
  (setq YaTeX-latex-message-code 'utf-8)
  (setq YaTeX-use-LaTeX2e t)
  (setq YaTeX-use-AMS-LaTeX t)
  (auto-fill-mode 0)
;  (reftex-mode 1)
  (set (make-local-variable 'company-backends) '(company-ispell)))

(use-package reftex
  :ensure nil
  :hook (yatex-mode . reftex-mode)
  :bind (:map reftex-mode-map
              ("C-c (" . reftex-reference)
              ("C-c )" . nil)
              ("C-c >" . YaTeX-comment-region)
              ("C-c <" . YaTeX-uncomment-region))
  :defer t
  :custom
  (reftex-ref-style-default-list '("Cleveref") "Use cref/Cref as default"))

(cond ((member (system-name) '("MacBook-Pro-3.local" "uranus.fos.kuis.kyoto-u.ac.jp"))
       (setenv "PATH"
               (concat (getenv "PATH") ":/Library/TeX/texbin"))
       (setq tex-command "/Library/TeX/texbin/latexmk -pdf -pvc -view=none")
       (setq YaTeX-dvi2-command-ext-alist
             '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
       (setq dvi2-command "/usr/bin/open -a Skim")
       (setq tex-pdfview-command "/usr/bin/open -a Skim")
       (setq dviprint-command-format "/usr/bin/open -a \"Adobe Acrobat Reader DC\" `echo %s | gsed -e \"s/\\.[^.]*$/\\.pdf/\"`"))

      ((equal (system-name) "reimu")
       (setq tex-command "/usr/bin/latexmk -pdf -pvc -view=none")
       (setq dvi2-command "/usr/bin/evince")
       (setq tex-pdfview-command "/usr/bin/evince")
       (setq dviprint-command-format "/usr/bin/dvipdfmx")
       (require 'dbus)
       (defun un-urlify (fname-or-url)
         "A trivial function that replaces a prefix of file:/// with just /."
         (if (string= (substring fname-or-url 0 8) "file:///")
             (substring fname-or-url 7)
           fname-or-url))
       (defun evince-inverse-search (file linecol &rest ignored)
         (let* ((fname (decode-coding-string (url-unhex-string (un-urlify file)) 'utf-8))
                (buf (find-file fname))
                (line (car linecol))
                (col (cadr linecol)))
           (if (null buf)
               (message "[Synctex]: %s is not opened..." fname)
             (switch-to-buffer buf)
             (goto-char 0)
             (forward-line (car linecol))
             (unless (= col -1)
               (move-to-column col))
             (x-focus-frame (selected-frame)))))
       (dbus-register-signal
        :session nil "/org/gnome/evince/Window/0"
        "org.gnome.evince.Window" "SyncSource"
        'evince-inverse-search)
       (with-eval-after-load 'yatexprc
         (defun YaTeX-preview-jump-line ()
           "Call jump-line function of various previewer on current main file"
           (interactive)
           (save-excursion
             (save-restriction
               (widen)
               (let*((pf (or YaTeX-parent-file
                             (save-excursion (YaTeX-visit-main t) (buffer-file-name))))
                     (pdir (file-name-directory pf))
                     (bnr (substring pf 0 (string-match "\\....$" pf)))
                                        ;(cf (file-relative-name (buffer-file-name) pdir))
                     (cf (buffer-file-name)) ;2016-01-08
                     (buffer (get-buffer-create " *preview-jump-line*"))
                     (line (count-lines (point-min) (point-end-of-line)))
                     (previewer (YaTeX-preview-default-previewer))
                     (cmd (cond
                           ((string-match "Skim" previewer)
                            (format "%s %d '%s.pdf' '%s'"
                                    YaTeX-cmd-displayline line bnr cf))
                           ((string-match "evince" previewer)
                            (format "%s '%s.pdf' %d '%s'"
                                    "fwdevince" bnr line cf))
                           ((string-match "sumatra" previewer)
                            (format "%s \"%s.pdf\" -forward-search \"%s\" %d"
                                    previewer bnr cf line))
                           ((string-match "zathura" previewer)
                            (format "%s --synctex-forward '%d:0:%s' '%s.pdf'"
                                    previewer line cf bnr))
                           ((string-match "qpdfview" previewer)
                            (format "%s '%s.pdf#src:%s:%d:0'"
                                    previewer bnr cf line))
                           ((string-match "okular" previewer)
                            (format "%s '%s.pdf#src:%d %s'"
                                    previewer bnr line (expand-file-name cf)))
                           )))
                 (YaTeX-system cmd "jump-line" 'noask pdir))))))
       (add-hook 'yatex-mode-hook
                 '(lambda ()
                    (auto-fill-mode -1)))))

;; flycheck
(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :config
  (flycheck-add-mode 'tex-chktex 'yatex-mode)
  (flycheck-add-mode 'tex-lacheck 'yatex-mode)
  (cond ((equal (system-name) "Masakis-MacBook-Pro.local")
         (setq flycheck-tex-chktex-executable "/Library/TeX/texbin/chktex")
  )))

(provide '40-YaTeX)
;;; 40-YaTeX.el ends here
