;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-059) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; dimensions for the traffic light
(define WIDTH 90)
(define HEIGHT 30)

; whitespace for spacing out the lights
(define WHITESPACE (rectangle 5 0 "solid" "white"))

; radius of the traffic light bulb circle
(define RADIUS 10)

; the traffic light background
(define BACKG (empty-scene 90 30))

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; TrafficLight Boolean -> Image
; renders a bulb by whether or not it's lit
(check-expect
 (render-bulb "red" #false) (circle RADIUS "outline" "red"))
(check-expect
 (render-bulb "green" #true) (circle RADIUS "solid" "green"))
(check-expect
 (render-bulb "yellow" #false) (circle RADIUS "outline" "yellow"))
(define (render-bulb color lit?)
  (circle RADIUS (if lit? "solid" "outline") color))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next "red") "green")
(check-expect (tl-next "green") "yellow")
(check-expect (tl-next "yellow") "red")
(define (tl-next cs)
  (cond
    [(string=? cs "red") "green"]
    [(string=? cs "green") "yellow"]
    [(string=? cs "yellow") "red"]))
 
; TrafficLight -> Image
; renders the current state cs as an image
(check-expect
 (tl-render
  "red")
  (overlay
   (beside
    WHITESPACE
    (render-bulb "red" #true)
    WHITESPACE
    (render-bulb "yellow" #false)
    WHITESPACE
    (render-bulb "green" #false)
    WHITESPACE)
   BACKG))
(check-expect
 (tl-render
  "yellow")
  (overlay
   (beside
    WHITESPACE
    (render-bulb "red" #false)
    WHITESPACE
    (render-bulb "yellow" #true)
    WHITESPACE
    (render-bulb "green" #false)
    WHITESPACE)
   BACKG))
(check-expect
 (tl-render
  "green")
  (overlay
   (beside
    WHITESPACE
    (render-bulb "red" #false)
    WHITESPACE
    (render-bulb "yellow" #false)
    WHITESPACE
    (render-bulb "green" #true)
    WHITESPACE)
   BACKG))
(define (tl-render current-state)
  (overlay
   (beside
    WHITESPACE
    (render-bulb "red" (string=? current-state "red"))
    WHITESPACE
    (render-bulb "yellow" (string=? current-state "yellow"))
    WHITESPACE
    (render-bulb "green" (string=? current-state "green"))
    WHITESPACE)
   BACKG))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))