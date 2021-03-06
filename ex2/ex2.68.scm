(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))
(define (encode-symbol symbol tree)
  (define (encode-symbol-iter current-branch bits)
    (if (null? current-branch)
      bits
      (let ((next-branch (choose-branch symbol current-branch)))
        (cond ((= next-branch (left-branch current-branch))
               (encode-symbol-iter next-branch (append bits (list '0))))
              ((= next-branch (right-branch current-branch))
               (encode-symbol-iter next-branch (append bits (list '1))))
              (else
                (error "bad symbol -- CHOOSE BRANCH" symbol))))))
  (encode-symbol-iter tree '()))
(define (choose-branch symbol tree)
  (cond ((and (not (null? (left-branch tree)))
              (element-of-set? symbol (left-branch tree)))
         (left-branch tree))
        ((and (not (null? (right-branch tree)))
              (element-of-set? symbol (right branch tree)))
         (right-branch tree))
        (else '())))
