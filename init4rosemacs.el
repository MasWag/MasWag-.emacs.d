;; Tell emacs where to find the rosemacs sources
;; replace the path with location of rosemacs on your system
(push "~/.emacs.d/rosemacs" load-path) 

;; Load the library and start it up
(require 'rosemacs)
(invoke-rosemacs)

;; Optional but highly recommended: add a prefix for quick access
;; to the rosemacs commands
(global-set-key "\C-x\C-r" ros-keymap)
