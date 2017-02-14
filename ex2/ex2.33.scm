(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (square x) (* x x))
(my-map square (list 1 2 3 4 5))

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1)
          (append (cdr list1) list2))))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(my-append (list 1 2 3) (list 4 5 6))

(define (length sequence)
  (if (null? sequence)
    0
    (+ 1
       (length (cdr sequence)))))

(define (my-length sequence)
  (accumulate (lambda (x y) (+ 1 y))
              0 sequence))

(my-length (list 1 2 3 4))
