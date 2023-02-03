;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-039) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; single constant definition to change
(define WHEEL-RADIUS 10)
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

; distance from center to the edge
(define CENTER-TO-TOP (/ (+ TOP-HEIGHT BODY-HEIGHT) 2))

; image representing the car
(define CAR (underlay/offset CAB 0 CENTER-TO-TOP TWO-WHEEL))