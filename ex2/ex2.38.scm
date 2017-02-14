(define (my-fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
(my-fold-left / 1 (list 1 2 3))
(fold-right list '() (list 1 2 3))
(my-fold-left list '() (list 1 2 3))
