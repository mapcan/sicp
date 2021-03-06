(define (unique-query exps)
  (cdr exps))
(define (singleton? stream)
  (and (not (stream-null? stream))
       (stream-null? (stream-cdr stream))))
(define (uniquely-asserted operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (let ((stream (qeval (unique-query operands)
                           (singleton-stream frame))))
        (if (singleton? stream)
          stream
          the-empty-stream)))
    frame-stream))
(put 'unique 'qeval uniquely-asserted)
