(define (cond-special-clause? clause)
  (eq? (cadr clause) '=>))
(define (cond-special-preficate clause)
  (car clause))
(define (cond-special-action clause)
  (caddr clause))
(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))
(define (expand-clauses clauses)
  (if (null? clauses)
    'false
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (cond ((cond-else-clause? first)
             (if (null? rest)
               (sequence->exp (cond-actions first))
               (error "ELSE clause isn't last -- COND->IF"
                      clauses))
             ((cond-special-clause? first)
              (list (make-lambda '(__asdf__)
                                 (make-if
                                   __asdf__
                                   (list
                                     (cond-special-action
                                       first)
                                     __asdf__)
                                   (expand-clauses rest)))
                    (cond-special-predicate first)))
             (else
               (make-if (cond-predicate first)
                        (sequence->exp (cond-actions first))
                        (expand-clauses rest))))))))
