(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

;(define (largest-of-three x y z)
;  (cond ((and (>= x y) (>= x z)) x)
;        ((and (>= y x) (>= y z)) y)
;        ((and (>= z x) (>= z y)) z)))

(define (larger x y)
  (if (>= x y)
    x
    y))

;(define (sum-of-two-largest-of-three x y z)
;  (cond ((= x (largest-of-three x y z)) (sum-of-squares x (larger y z)))
;        ((= y (largest-of-three x y z)) (sum-of-squares y (larger x z)))
;        ((= z (largest-of-three x y z)) (sum-of-squares z (larger x y)))))


(define (sum-of-two-largest-of-three x y z)
  (if (= x (larger x y))
    (sum-of-squares x (larger y z))
    (sum-of-squares y (larger x z))))

(sum-of-two-largest-of-three 1 3 4)
(sum-of-two-largest-of-three 4 1 3)
(sum-of-two-largest-of-three 3 4 1)
