(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average x y)
  (/ (+ x y) 2))

(define (make-segment start end)
  (cons start end))
(define (start-segment line)
  (car line))
(define (end-segment line)
  (cdr line))

(define (midpoint-segment line)
  (let ((midx (average (x-point (start-segment line))
                       (x-point (end-segment line))))
        (midy (average (y-point (start-segment line))
                       (y-point (end-segment line)))))
    (make-point midx midy)))

(print-point (midpoint-segment (make-segment (make-point 3 4) (make-point 5 6))))