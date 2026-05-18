(define (domain robokey)

(:requirements :strips :typing)

(:types
    room
    object
    key - object
    hand
    door
    battery
)

(:predicates

    (at ?r - room)

    (object-at ?o - object ?r - room)
    
    (clear ?r - room)

    (holding ?h - hand ?o - object)

    (handfree ?h - hand)

    (door-open ?d - door)

    (connects ?r1 ?r2 - room ?d - door)

    (opens ?k - key ?d - door)

    (battery-level ?b - battery)

    (next-battery ?b1 ?b2 - battery)

    (charging-station ?r - room)

    (full ?b - battery)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:action move

:parameters
(?from ?to - room
 ?d - door
 ?b1 ?b2 - battery)

:precondition

(and
(at ?from)

(connects ?from ?to ?d)

(door-open ?d)

(battery-level ?b1)

(next-battery ?b1 ?b2)
)

:effect

(and

(at ?to)

(not (at ?from))

(not (battery-level ?b1))
(battery-level ?b2)

)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:action get

:parameters
(?r - room
 ?o - object
 ?h - hand
 ?b1 ?b2 - battery)

:precondition

(and

(at ?r)

(object-at ?o ?r)

(handfree ?h)

(battery-level ?b1)

(next-battery ?b1 ?b2)

)

:effect

(and

(holding ?h ?o)

(not(handfree ?h))

(not(object-at ?o ?r))

(clear ?r)

(not(battery-level ?b1))
(battery-level ?b2)

)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:action put

:parameters

(?r - room
 ?o - object
 ?h - hand
 ?b1 ?b2 - battery)

:precondition

(and

(at ?r)

(holding ?h ?o)

(clear ?r)

(battery-level ?b1)

(next-battery ?b1 ?b2)

)

:effect

(and

(object-at ?o ?r)

(not(clear ?r))

(handfree ?h)

(not(holding ?h ?o))

(not(battery-level ?b1))
(battery-level ?b2)

)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:action open-door

:parameters

(?r1 ?r2 - room
 ?d - door
 ?k - key
 ?h - hand
 ?b1 ?b2 - battery)

:precondition

(and

(at ?r1)

(connects ?r1 ?r2 ?d)

(holding ?h ?k)

(opens ?k ?d)

(not(door-open ?d))

(battery-level ?b1)

(next-battery ?b1 ?b2)

)

:effect

(and

(door-open ?d)

(not(battery-level ?b1))
(battery-level ?b2)

)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:action charge

:parameters

(?r - room
 ?b ?fullb - battery)

:precondition

(and

(at ?r)

(charging-station ?r)

(battery-level ?b)

(full ?fullb)

)

:effect

(and

(not(battery-level ?b))
(battery-level ?fullb)

)
)

)