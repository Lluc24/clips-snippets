(defrule no_list
    (not (list ?))
    =>
    (printout t "Enter a sequence of elements" crlf)
    (assert (list (explode$ (readline))))
)

(defrule maximum
    (not (max ?))
    (list $? ?max $?)
    (not (list $? ?e&:(> ?e ?max) $?))
    =>
    (assert (max ?max))
)

(defrule finished
    (max ?max)
    =>
    (printout t "The maximum is " ?max crlf)
)

(run)
