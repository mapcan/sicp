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

(define empty-board nil)

(define (adjoin-position row k queens)
  (append queens (list row)))

(define (accum combiner null-value term a next b)
  (define (iter a result)
    (if (>= a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (safe? k queens)
  (let ((kth (list-ref queens (- k 1))))
    (accum (lambda (x y)
             (and x y))
           #t
           (lambda (i)
             (let ((k-1th (list-ref queens i)))
               (if (not (= (+ i 1) (- k 1)))
                 (not (= k-1th kth))
                 (and (not (= kth k-1th))
                      (not (= kth (- k-1th 1)))
                      (not (= kth (+ k-1th 1)))))))
           0 (lambda (x) (+ x 1)) (- k 1))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)
