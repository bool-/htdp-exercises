;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-044) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; single constant definition to change
(define WHEEL-RADIUS 5)
; space between the two wheels
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))

; image representing the whitespace between two wheels
(define SPACE (rectangle WHEEL-DISTANCE 0 "solid" "white"))
; image representing a wheel
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
; image representing both wheels
(define TWO-WHEEL (beside WHEEL SPACE WHEEL))

; the color of the car
(define CAR-COLOR "blue")

; constants defining the size of the car's body
(define BODY-WIDTH (* WHEEL-RADIUS 7))
(define BODY-HEIGHT (* WHEEL-RADIUS 2))

; image representing the cars body
(define BODY (rectangle BODY-WIDTH BODY-HEIGHT "solid" CAR-COLOR))

; constants defining the size of the car's top
(define TOP-WIDTH (* WHEEL-RADIUS 4))
(define TOP-HEIGHT WHEEL-RADIUS)

; image representing the top of the car
(define TOP (rectangle TOP-WIDTH TOP-HEIGHT "solid" CAR-COLOR))

; image representing the cab of the car
(define CAB (above TOP BODY))

; distance from center to the edge car
(define CENTER-TO-TOP (/ (+ TOP-HEIGHT BODY-HEIGHT) 2))

; image representing the car
(define CAR (underlay/offset CAB 0 CENTER-TO-TOP TWO-WHEEL))

; a pretty little tree
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))


; width and height for the background
(define BACKGROUND-WIDTH 200)
(define BACKGROUND-HEIGHT 50)

; tree y location calcualted distance from the center
(define Y-TREE (- BACKGROUND-HEIGHT (/ (image-height TREE) 2)))

; tree x location calcualted at a 3rd of the distance
(define X-TREE (/ BACKGROUND-WIDTH 3))

; image representing the background
(define BACKGROUND
  (place-image TREE
               X-TREE
               Y-TREE
               (empty-scene BACKGROUND-WIDTH BACKGROUND-HEIGHT)))

; car y location calcualted distance from the center
(define Y-CAR (- BACKGROUND-HEIGHT (/ (image-height CAR) 2)))

; the amount of pixels the car moves per tick
(define PX-PER-TICK 3)

; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 100) (place-image CAR 100 Y-CAR BACKGROUND))
(check-expect (render 150) (place-image CAR 150 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))
(define (render cw)
  (place-image CAR cw Y-CAR BACKGROUND))

; WorldState -> WorldState
; for each tick of the clock, return
; (+ cw PX-PER-TICK)
(check-expect (clock-tick-handler 5) (+ 5 PX-PER-TICK))
(check-expect (clock-tick-handler 10) (+ 10 PX-PER-TICK))
(check-expect (clock-tick-handler 15) (+ 15 PX-PER-TICK))
(check-expect (clock-tick-handler 20) (+ 20 PX-PER-TICK))
(define (clock-tick-handler cw)
  (+ cw PX-PER-TICK))

; WorldState -> Boolean
; returns #true when the car object has
; driven off the background image
(check-expect (end? 10) #false)
(check-expect (end? (+ BACKGROUND-WIDTH 100)) #true)
(define (end? cw)
  (if (> (- cw (/ (image-width CAR) 2)) BACKGROUND-WIDTH) #true #false))

; WorldState Number Number String -> WorldState
; places the car at the x mouse position
; if the me is "button-down"
(check-expect (teleport 21 10 20 "enter") 21)
(check-expect (teleport 42 10 20 "button-down") 10)
(check-expect (teleport 42 10 20 "move") 42)
(define (teleport cw x y me)
  (cond
    [(string=? "button-down" me) x]
    [else cw]))

; WorldState -> WorldState
; starts the program from an initial WorldState
(define (main ws)
  (big-bang ws
    [to-draw render]
    [on-tick clock-tick-handler]
    [on-mouse teleport]
    [stop-when end?]))