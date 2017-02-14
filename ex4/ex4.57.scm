(rule (same ?x ?x))

(rule (different ?x ?y)
      (not (same ?x ?y)))

(rule (same-job ?person-1 ?person-2)
      (same (job ?person-1 ?job)
            (job ?person-2 ?job)))

(rule (replace ?person-1 ?person-2)
      (and (or (same-job ?person-1 ?person-2)
               (can-do-job (job ?person-1 ?job-1)
                           (job ?person-2 ?job-2)))
           (different ?person-1 ?person-2)))

(replace ?person (Fect Cy D))

(and (replace ?people ?someone)
     (salary ?someone ?paid-someone)
     (salary ?people ?paid-people)
     (lisp-value > ?paid-someone ?paid-people))
