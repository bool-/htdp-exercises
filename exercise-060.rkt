;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-060) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; An N-TrafficLight is one of:
; – 0 interpretation the traffic light shows red
; – 1 interpretation the traffic light shows green
; – 2 interpretation the traffic light shows yellow

; N-TrafficLight Boolean -> Image
; renders a bulb by whether or not it's lit
(check-expect
 (render-bulb 0 #false) (circle RADIUS "outline" "red"))
(check-expect
 (render-bulb 1 #true) (circle RADIUS "solid" "green"))
(check-expect
 (render-bulb 2 #false) (circle RADIUS "outline" "yellow"))
(define (render-bulb color lit?)
  (circle
   RADIUS (if lit? "solid" "outline")
   (cond
     [(= color 0) "red"]
     [(= color 1) "green"]
     [(= color 2) "yellow"])))

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next-numeric 0) 1) ; red -> green
(check-expect (tl-next-numeric 1) 2) ; green -> yellow
(check-expect (tl-next-numeric 2) 0) ; yellow -> red
(define (tl-next-numeric cs) (modulo (+ cs 1) 3))
 
; N-TrafficLight -> Image
; renders the current state cs as an image
(check-expect
 (tl-render
  0)
  (overlay
   (beside
    WHITESPACE
    (render-bulb 0 #true)
    WHITESPACE
    (render-bulb 2 #false)
    WHITESPACE
    (render-bulb 1 #false)
    WHITESPACE)
   BACKG))
(check-expect
 (tl-render
  2)
  (overlay
   (beside
    WHITESPACE
    (render-bulb 0 #false)
    WHITESPACE
    (render-bulb 2 #true)
    WHITESPACE
    (render-bulb 1 #false)
    WHITESPACE)
   BACKG))
(check-expect
 (tl-render
  1)
  (overlay
   (beside
    WHITESPACE
    (render-bulb 0 #false)
    WHITESPACE
    (render-bulb 2 #false)
    WHITESPACE
    (render-bulb 1 #true)
    WHITESPACE)
   BACKG))
(define (tl-render current-state)
  (overlay
   (beside
    WHITESPACE
    (render-bulb 0 (= current-state 0))
    WHITESPACE
    (render-bulb 2 (= current-state 2))
    WHITESPACE
    (render-bulb 1 (= current-state 1))
    WHITESPACE)
   BACKG))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next-numeric 1]))