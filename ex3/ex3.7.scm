(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (define (wrong-password a)
      "Incorrect password")
    (if (not (eq? p password))
      wrong-password
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m)))))
  dispatch)
(define (make-joint account old-password new-password)
  (define (wrong-password a)
    "Incorrect password")
  (lambda (p m)
    (if (not (eq? p new-password))
      wrong-password
      (account old-password m))))

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'secret-password 'withdraw) 80)
((acc 'shit 'deposit) 50)

(define paul
  (make-joint acc 'secret-password 'new-pass))
((paul 'new-pass 'withdraw) 10)
