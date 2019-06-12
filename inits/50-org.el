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
        ("c" "CyVeriA Lab Note" entry (file+headline "~/wiki/Research/cyveria.org" "Lab Notebook")
         "* TODO %?\nEntered on %U\n" :prepend t)
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

(setq org-agenda-files '("~/wiki/" "~/wiki/Diary/" "~/wiki/Research/"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

(use-package org-mode
  :bind (("C-c l" . org-store-link))
  )
