;;; Package -- Summary
;;; Commentary:
;;; Code:

(require 's)

(defun lower-camelize-region (p1 p2)
  "Make the region lower camel case.  P1 is the start position, and P2 is the end position of the region."
  (interactive "r")
  (insert
   (s-lower-camel-case
    (buffer-substring p1 p2)
    ))
  (delete-region p1 p2)
  )

(defun upper-camelize-region (p1 p2)
  "Make the region upper camel (Pascal) case.  P1 is the start position, and P2 is the end position of the region."
  (interactive "r")
  (insert
   (s-upper-camel-case
    (buffer-substring p1 p2)
    ))
  (delete-region p1 p2)
  )

(defun snakize-region (p1 p2)
  "Make the region snake case.  P1 is the start position, and P2 is the end position of the region."
  (interactive "r")
  (insert
   (s-snake-case
    (buffer-substring p1 p2)
    ))
  (delete-region p1 p2)
  )


(provide '60-case-trans)
;;; 60-case-trans.el ends here
