(define nil '())

(define (my-reverse lst)
  (define (iter items result)
    (if (null? items)
      result
      (iter (cdr items) (cons (car items) result))))
  (iter lst nil))

(my-reverse (list 1 2 3 4 5))
(my-reverse nil)
