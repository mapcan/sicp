(define random-init 123)
(define (rand-update x) (+ x 1))

(define rand
  (let ((x random-init))
    (define (dispatch function)
      (cond ((eq? function 'generate)
             (set! x (rand-update x))
             x)
            ((eq? function 'reset)
             (lambda (new-value)
               (set! x new-value)))
            (else
              (error "Unknown function -- RAND"
                     function))))
    dispatch))

(rand 'generate)
(rand 'generate)
((rand 'reset) 2)
(rand 'generate)
