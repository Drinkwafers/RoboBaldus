(define (problem robokey1)

(:domain robokey)

(:objects

room0 room1 room2 room3 - room

door_0_1
door_1_2
door_2_3
door_0_3 - door

box1 - object

left right - hand

b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - battery

)

(:init

(at room0)

(handfree left)
(handfree right)

(object-at box1 room1)

;;;;;;;;;;;;;;;;;;;;;;
;; STANZE LIBERE
;;;;;;;;;;;;;;;;;;;;;;

(clear room0)
(clear room2)
(clear room3)

;;;;;;;;;;;;;;;;;;;;;;

(connects room0 room1 door_0_1)
(connects room1 room0 door_0_1)

(connects room1 room2 door_1_2)
(connects room2 room1 door_1_2)

(connects room2 room3 door_2_3)
(connects room3 room2 door_2_3)

(connects room0 room3 door_0_3)
(connects room3 room0 door_0_3)

;;;;;;;;;;;;;;;;;;;;;;

(door-open door_0_1)
(door-open door_1_2)
(door-open door_2_3)
(door-open door_0_3)

;;;;;;;;;;;;;;;;;;;;;;

(battery-level b10)

(next-battery b10 b9)
(next-battery b9 b8)
(next-battery b8 b7)
(next-battery b7 b6)
(next-battery b6 b5)
(next-battery b5 b4)
(next-battery b4 b3)
(next-battery b3 b2)
(next-battery b2 b1)
(next-battery b1 b0)

(charging-station room3)

(full b10)

)

(:goal

(and

(at room0)

(object-at box1 room0)

(handfree left)
(handfree right)

)

)

)