(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))
(define (cube x)
  (* x x x))
(define (inc x)
  (+ x 1))
(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term x)
    (define (yk k) (f (+ a (* h k))))
    (* (cond ((or (= x 0) (= x n)) (yk x))
             ((even? x) 2)
             (else 4))
       (yk x)))
  (* (/ h 3) (sum simpson-term 0 inc n)))

(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)
