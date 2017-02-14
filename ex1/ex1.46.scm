(define (iterative-improve good-enough? improve)
  (lambda (x)
    (let ((xx (improve x)))
      (if (good-enough? x xx)
        xx
        ((iterative-improve good-enough? improve) xx)))))
