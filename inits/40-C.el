;;; settings4eldoc
;; add in your commonly used packages/include directories here, for
;; example, SDL or OpenGL. this shouldn't slow down cpp, even if
;; you've got a lot of them
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;; hideshow
(add-hook 'c-mode-hook 'hs-minor-mode)

;;; settings4toggle-dot-pointer
(load-file "~/.emacs.d/c-toggle-dot-pointer.el")
