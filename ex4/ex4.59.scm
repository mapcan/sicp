(meeting ?x (Friday . ?y))

(rule (meeting-time ?person ?day-and-time)
      (and (job ?person (?division . ?type))
           (or (meeting whole-company ?day-and-time)
               (meeting ?division ?day-and-time))))

(meeting-time (Hacker Alyssa P) (Wednesday . ?x))
