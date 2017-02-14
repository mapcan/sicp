(define (list-of-values-from-left-to-right exps env)
  (if (no-operands? exps)
    (let ((first (eval (first-operand exps) env)))
      (cons first (list-of-values-from-left-to-right
                    (rest-operands exps) env)))))
(define (list-of-values-from-right-to-left exps env)
  (if (no-operands? exps)
    (let ((rest (list-of-values-from-right-to-left
                  (rest-operands exps) env)))
      (let ((first (eval (first-operand exps) env)))
        (cons first rest)))))
