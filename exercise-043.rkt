;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-043) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; distance from center to the top/bottom car
(define CENTER-TO-TOP (/ (+ TOP-HEIGHT BODY-HEIGHT) 2))

; distance from center to the edge car
(define CENTER-TO-EDGE (/ BODY-WIDTH 2))

; image representing the car
(define CAR (underlay/offset CAB 0 CENTER-TO-TOP TWO-WHEEL))

; a pretty little tree
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))


; width and height for the background
(define BACKGROUND-WIDTH 500)
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

; velocity of the car
(define V 10)

; Number -> Number
; calculate the distance from a clock tick
; using a sine wave
(define (dist t)
  (+ (* V (sin t)) t))

; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started

; AnimationState -> Image
; places the car into the BACKGROUND scene,
; according to the given AnimationState
(check-expect
 (render 10) (place-image CAR (dist 10) Y-CAR BACKGROUND))
(check-expect
 (render 30) (place-image CAR (dist 30) Y-CAR BACKGROUND))
(check-expect
 (render 60) (place-image CAR (dist 60) Y-CAR BACKGROUND))
(check-expect
 (render 100) (place-image CAR (dist 100) Y-CAR BACKGROUND))
(define (render t)
  (place-image CAR (dist t) Y-CAR BACKGROUND))

; AnimationState -> AnimationState
; increments the time counter, t by 1 tick
(check-expect (tock 1) 2)
(check-expect (tock 19) 20)
(check-expect (tock 33) 34)
(define (tock t)
  (+ t 1))

; AnimationState-> Boolean
; checks to see if the car has driven off
; the background image
(check-expect (end? 10) #false)
(check-expect (end? 1000) #true)
(define (end? t)
  (> (- (dist t) (/ (image-width CAR) 2)) BACKGROUND-WIDTH))

; AnimationState -> AnimationState
; starts the animation from the initial tick, t.
(define (main t)
  (big-bang t
    [to-draw render]
    [on-tick tock]
    [stop-when end?]))
