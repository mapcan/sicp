(define (make-vect x y)
  (cons x y))
(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vec)
  (cdr vect))
(define (add-vect vect1 vect2)
  (cons (+ (xcor-vect vect1) (xcor-vect vect2))
        (+ (ycor-vect vect1) (ycor-vect vect2))))
(define (sub-vect vect1 vect2)
  (cons (- (xcor-vect vect1) (xcor-vect vect2))
        (- (ycor-vect vect1) (ycor-vect vect2))))
(define (scale-vect vect scale)
  (cons (* (xcor-vect vect) scale)
        (* (ycor-vect vect) scale)))
