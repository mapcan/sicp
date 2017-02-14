(define (and? exp)
  (tagged-list? exp 'and))
(define (and-clauses exp)
  (cdr exp))
(define (eval-and clauses env)
  (if (null? clauses)
    true
    (if (not (eval (car clauses) env))
      false
      (eval-and (cdr clauses)))))
(define (and->if exp)
  (expand-and-clauses (and-clauses exp)))
(define (expand-and-clauses clauses)
  (if (null? clauses)
    'true
    (make-if (car clauses)
             (expand-and-clauses (cdr clauses))
             'false)))
(define (or? exp)
  (tagged-list? exp 'or))
(define (or-clauses exp)
  (cdr exp))
(define (eval-or clauses env)
  (if (null? clauses)
    'false
    (if (eval (car clauses) env)
      'true
      (eval-or (cdr clauses)))))
(define (or->if exp)
  (expand-or-clauses (or-clauses exp)))
(define (expand-or-clauses clauses)
  (if (null? clauses)
    'false
    (make-if (car clauses)
             'true
             (expand-or-clauses (cdr clauses)))))
(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(and->if '(and (= a 1) (< b 2) (> c 3)))
(or->if '(and (= a 1) (< b 2) (> c 3)))
