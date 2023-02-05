;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-051) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; the traffic light circle radius
(define TRAFFIC-LIGHT-RADIUS 10)

; A TrafficLightState is one of the follow Strings:
; - "red"
; - "green"
; - "yellow"
; interpretation the three possible states of
; a traffic light

; TrafficLightState -> TrafficLightState
; determines the next TrafficLightState
; based on the current TrafficLightState (s)
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; TrafficLightState -> Image
; renders an a circle matching the color
; of the current TrafficLightState (s)
(check-expect (render "red") (circle TRAFFIC-LIGHT-RADIUS "solid" "red"))
(check-expect (render "green") (circle TRAFFIC-LIGHT-RADIUS "solid" "green"))
(check-expect (render "yellow") (circle TRAFFIC-LIGHT-RADIUS "solid" "yellow"))
(define (render t)
  (circle TRAFFIC-LIGHT-RADIUS "solid" t))

; TrafficLightState -> TrafficLightState
; begins the traffic light big-bang program
; what color should a traffic light be to start?
; how long in between TrafficLightState changes?
(define (traffic-light s)
  (big-bang "red"
    [on-tick traffic-light-next 3]
    [to-draw render]))