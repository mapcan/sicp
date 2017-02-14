(define (my-equal? a b)
  (cond ((and (not (pair? a))
              (not (pair? b)))
         (eq? a b))
        ((and (pair? a)
              (pair? b))
         (and (eq? (car a) (car b))
              (my-equal? (cdr a) (cdr b))))
        (else #f)))

(my-equal? 1 1)
(my-equal? 1 2)
(my-equal? '() 1)
(my-equal? '() (list 1 2))
(my-equal? (list 1 2 3) (list 1 2 3))
(my-equal? '() '(1 2))
(my-equal? '(1 2 3) '(1 2 3))
(my-equal? '(1 2 3) '(2 3 4))
