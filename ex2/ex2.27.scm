(define nil '())

;(define (my-reverse lst)
;  (define (iter items result)
;    (if (null? items)
;      result
;      (iter (cdr items) (cons (car items) result))))
;  (iter lst nil))

(define (deep-reverse lst)
  (define (iter items result)
    (if (null? items)
      result
      (let ((head (car items)))
        (iter (cdr items) (cons (if (pair? head)
                                  (deep-reverse head)
                                  head)
                                result)))))
  (iter lst nil))

(deep-reverse (list 1 2 3 4 5))
(deep-reverse nil)

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x)
