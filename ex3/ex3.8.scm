(define f
  (let ((c true))
    (lambda (a)
      (cond (c
             (set! c false)
             a)
            (else
              0)))))

(f 1)
(f 0)
