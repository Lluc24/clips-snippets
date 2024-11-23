(defrule no_list
    (not (list ?))
    =>
    (printout t "Enter a sequence of elements" crlf)
    (assert (list (explode$ (readline))))
)

(defrule rise_up
    ?old_list <- (list $?slice1 ?e1 ?e2 $?slice2)
    (test (> ?e1 ?e2))
    =>
    (assert (list ?slice1 ?e2 ?e1 ?slice2))
    (retract ?old_list)
)

(defrule finished
    (not (list $?slice1 ?e1 ?e2&:(> ?e1 ?e2) $?slice2))
    (list $?values)
    =>
    (printout t "The sequence ordered is " ?values crlf)
)
