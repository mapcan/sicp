(define random-init 756385)
(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (square x)
  (* x x))

(define (P x1 x2 y1 y2)
  (lambda ()
    (< (+ (square (- (random-in-range x1 x2) 5))
          (square (- (random-in-range y1 y2) 7)))
       (square 3))))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (monte-carlo trials (P x1 x2 y1 y2)))

(/ (* (estimate-integral P 2.0 8.0 4.0 10.0 25000) 36.0) 9.0)
