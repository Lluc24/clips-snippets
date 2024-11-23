(deffacts initial_facts
    (factorial 1 1)
)

(defrule limit_rule
    (not (limit ?))
    =>
    (printout t "Enter the factorial to compute" crlf)
    (assert (limit (read)))
)

(defrule factorial_rule
    ?f <- (factorial ?x ?y)
    (limit ?l)
    (test (< ?x ?l))
    =>
    (assert (factorial (+ ?x 1) (* ?y (+ ?x 1))))
    (retract ?f)
)

(defrule end_rule
    (factorial ?x ?y)
    (limit ?l)
    (test (= ?x ?l))
    =>
    (printout t "The factorial of " ?x " is " ?y crlf)
)

(reset)
(run)
