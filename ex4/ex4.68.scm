(rule (reverse () ()))
(rule (reverse (?x ?y))
      (and (append-to-form (?first) ?rest ?x)
           (append-to-form ?reversed (?first) ?y)
           (reverse ?rest ?reversed)))
