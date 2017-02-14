(define nil '())
(define (enumerate-interval a b)
  (if (> a b)
    nil
    (cons a (enumerate-interval (+ a 1) b))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (flatmap proc sequence)
  (accumulate append nil (map proc sequence)))

(define (ordered-triples n)
  (flatmap (lambda (i)
         (flatmap (lambda (j)
                (map (lambda (k) (list i j k))
                       (enumerate-interval (+ j 1) n)))
              (enumerate-interval (+ i 1) n)))
       (enumerate-interval 1 n)))

(define (shit n s)
  (filter (lambda (i) (= s (accumulate + 0 i)))
          (ordered-triples n)))

(shit 10 9)
