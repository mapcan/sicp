(define (my-for-each proc items)
  (define (for items)
    (proc (car items))
    (my-for-each proc (cdr items)))
  (if (not (null? items))
    (for items)))

(my-for-each (lambda (x) (newline) (display x))
             (list 1 2 3 4 5))
(my-for-each (lambda (x) (newline) (display x))
             ('())