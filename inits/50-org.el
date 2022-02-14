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
        ("k" "研究会" entry (file+headline "~/wiki/Research/research_notes.org" "研究会")
         "* %?\nEntered on %U\n %i\n %a")
        ;; ("c" "CyVeriA" entry (file "~/wiki/Research/cyveria.org")
        ;;  "* %?\nEntered on %U" )
;         "* TODO %?\nEntered on %U\n\n- Purpose :: \n\n** Output mapper\n\n** Specification\n\n** Result" :prepend t)
        ("h" "HAMoni" entry (file "~/parametric_HA_monitor/meeting_note.txt")
         "* %<%Y-%m-%d %a>\nEntered on %U\n** Masaki %?\n\n** Etienne" 
         :prepend t)
        ("d" "ActiveDTALearning" entry (file+headline "~/wiki/Research/ActiveDTALearning.org" "Notes")
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
         "** %?\nEntered on %U\n %i\n %a")
        ("p" "PPL財務担当について" entry (file+headline "~/wiki/Research/research_notes.org" "ログ")
         "** %?\nEntered on %U\n %i\n %a")
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
(use-package org
  :config
  (use-package gnuplot
    :ensure t)
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-c l") 'org-store-link)
              (define-key org-mode-map (kbd "C-c g") 'org-mark-ring-goto)
;              (add-to-list 'company-backends 'company-ispell)
              ))
  (org-babel-do-load-languages 'org-babel-load-languages
                               '(
                                 (C . t)
                                 (plantuml . t)
                                 (dot . t)
                                 (python . t)
                                 (shell . t)
                                 (gnuplot . t)
                                 (maxima . t)
                                 )
                               ))
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
;; Pomodoro method with org-mode
(leaf org-pomodoro :ensure t :require t
    :hook
    (org-pomodoro-finished-hook . 
                                (lambda () 
                                  (shell-command
                                   "osascript ~/Library/Mobile*/*/Documents/toggle-do-not-disturb.applescript")))
    (org-pomodoro-started-hook . 
                               (lambda () 
                                 (shell-command
                                  "osascript ~/Library/Mobile*/*/Documents/toggle-do-not-disturb.applescript"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
