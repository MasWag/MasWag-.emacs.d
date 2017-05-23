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

(defun constr-region-from-symbol (func)
  "FUNC is the function to apply symbol."
  (let (bounds p1 p2)
    (setq bounds (bounds-of-thing-at-point 'symbol))
    (setq p1 (car bounds))
    (setq p2 (cdr bounds))
    (funcall func p1 p2)
    )
  )

(defun lower-camelize-symbol()
  "Make the current symbol lower camel case."
  (interactive)
  (constr-region-from-symbol #'lower-camelize-region)
  )

(defun upper-camelize-symbol ()
  "Make the symbol upper camel (Pascal) case."
  (interactive)
  (constr-region-from-symbol #'upper-camelize-region)
  )

(defun snakize-symbol ()
  "Make the symbol snake case."
  (interactive)
  (constr-region-from-symbol #'snakize-region)
  )


(provide '60-case-trans)
;;; 60-case-trans.el ends here
