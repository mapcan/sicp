(define (last-pair lst)
  (if (null? (cdr lst))
    lst
    (last-pair (cdr lst))))

(last-pair (list 23 72 149 34))
(last-pair (list 1))
(last-pair (cdr (list 1)))
