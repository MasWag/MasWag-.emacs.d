(setq org-directory "~/wiki")

(setq org-default-notes-file "notes.org")

; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/wiki/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ("r" "Research Note" entry (file+headline "~/wiki/Research/research_notes.org" "Research Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ;; ("c" "CyVeriA" entry (file "~/wiki/Research/cyveria.org")
        ;;  "* %?\nEntered on %U" )
;         "* TODO %?\nEntered on %U\n\n- Purpose :: \n\n** Output mapper\n\n** Specification\n\n** Result" :prepend t)
        ("h" "HyMon" entry (file "~/parametric_HA_monitor/meeting_note.txt")
         "* %<%Y-%m-%d %a>\nEntered on %U\n** Masaki %?\n\n** Etienne" 
         :prepend t)
        ("w" "Weely Review" entry (file "~/wiki/Research/weekly_review.org")
         "* %?\nEntered on %U" )
        ))

; メモをC-M-^一発で見るための設定
; https://qiita.com/takaxp/items/0b717ad1d0488b74429d から拝借
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/wiki/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))
; cf. https://www.emacswiki.org/emacs/OrgMode#toc21
(defun mhatta/org-buffer-files ()
  "Return list of opened Org mode buffer files"
  (mapcar (function buffer-file-name)
      (org-buffer-list 'files)))
(setq org-agenda-files '("~/wiki/Research/" "~/wiki/" "~/parametric_HA_monitor/meeting_note.txt"))
(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 3)
;                                 (mhatta/org-buffer-files :maxlevel . 2)
                                 )))

(use-package org-mode
  :bind (("C-c l" . org-store-link))
  :config
  (add-hook 'org-mode-hook
            (lambda ()
              (add-to-list 'company-backends 'company-ispell)))
  )
