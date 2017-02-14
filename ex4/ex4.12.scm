(define (env-loop env base-action match-action)
  (let ((frame (first-frame env)))
    (define (env-inner-loop env)
      (define (scan vars vals)
        (cond ((null? vars)
               (base-action env frame vars vals))
              ((eq? var (car vars))
               (match-action env frame vars vals))
              (else (scan (cdr vars) (cdr vals)))))
      (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (scan (frame-variables frame)
              (frame-values frame))))
    (env-inner-loop env)))
(define (lookup-variable-value var env)
  (env-loop env
            (lambda (env frame vars vals)
              (env-loop
                (enclosing-environment env)))
            (lambda (env frame vars vals)
              (car vals))))
(define (define-variable! var val env)
  (env-loop env
            (lambda (env frame vars vals)
              (let ((varr var)
                    (vall val))
                (add-binding-to-frame! varr vall frame)))
            (lambda (env frame vars vals)
              (let ((vall val))
                (set-car! vals vall)))))
(define (set-variable-value! var val env)
  (env-loop env
            (lambda (env frame vars vals)
              (env-loop
                (enclosing-environment env)))
            (lambda (env frame vars vals)
              (let ((vall val))
                (set-car! vals vall)))))