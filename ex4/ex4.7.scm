(define (let*? exp)
  (eq? (car exp) 'let*))
(define (let*-parameters exp)
  (cadr exp))
(define (let*-body exp)
  (cddr exp))
(define (let*->nested-lets exp)
  (let ((parameters (let*-parameters exp))
        (body (let*-body exp)))
    (define (make-let parameters)
      (if (null? parameters)
        body
        (let ((first (car parameters))
              (rest (cdr parameters)))
          (list 'let
                (list first)
                (make-let rest)))))
    (make-let parameters)))
