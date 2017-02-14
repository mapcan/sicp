(define (make-monitored f)
  (let ((times-called 0))
    (define (count-call m)
      (if (eq? m 'how-many-calls?)
        times-called
        (begin (set! times-called (+ times-called 1))
               (f m))))
    count-call))

(define s (make-monitored sqrt))

(s 100)
(s 'how-many-calls?)
(s 4)
(s 'how-many-calls?)
