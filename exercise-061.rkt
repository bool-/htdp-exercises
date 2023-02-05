;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-061) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; An S-TrafficLight is one of:
; – RED
; – GREEN
; – YELLOW

; S-TrafficLight Boolean -> Image
; renders a bulb by whether or not it's lit
(check-expect
 (render-bulb RED #false) (circle RADIUS "outline" "red"))
(check-expect
 (render-bulb GREEN #true) (circle RADIUS "solid" "green"))
(check-expect
 (render-bulb YELLOW #false) (circle RADIUS "outline" "yellow"))
(define (render-bulb color lit?)
  (circle
   RADIUS (if lit? "solid" "outline")
   (cond
     [(= color RED) "red"]
     [(= color GREEN) "green"]
     [(= color YELLOW) "yellow"])))

; S-TrafficLight -> S-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next-symbolic RED) GREEN)
(check-expect (tl-next-symbolic GREEN) YELLOW)
(check-expect (tl-next-symbolic YELLOW) RED)
(define (tl-next-symbolic cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))
 
; S-TrafficLight -> Image
; renders the current state cs as an image
(check-expect
 (tl-render
  RED)
  (overlay
   (beside
    WHITESPACE
    (render-bulb RED #true)
    WHITESPACE
    (render-bulb YELLOW #false)
    WHITESPACE
    (render-bulb GREEN #false)
    WHITESPACE)
   BACKG))
(check-expect
 (tl-render
  YELLOW)
  (overlay
   (beside
    WHITESPACE
    (render-bulb RED #false)
    WHITESPACE
    (render-bulb YELLOW #true)
    WHITESPACE
    (render-bulb GREEN #false)
    WHITESPACE)
   BACKG))
(check-expect
 (tl-render
  GREEN)
  (overlay
   (beside
    WHITESPACE
    (render-bulb RED #false)
    WHITESPACE
    (render-bulb YELLOW #false)
    WHITESPACE
    (render-bulb GREEN #true)
    WHITESPACE)
   BACKG))
(define (tl-render current-state)
  (overlay
   (beside
    WHITESPACE
    (render-bulb RED (= current-state RED))
    WHITESPACE
    (render-bulb YELLOW (= current-state YELLOW))
    WHITESPACE
    (render-bulb GREEN (= current-state GREEN))
    WHITESPACE)
   BACKG))

; S-TrafficLight -> S-TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next-symbolic 1]))