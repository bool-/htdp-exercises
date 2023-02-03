;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-047) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Dimensions for the scene
(define WIDTH 100)
(define HEIGHT 25)

; the background scene image
(define BACKGROUND (empty-scene WIDTH HEIGHT))

; the amount to increase/decrease on key up/key down events
(define INCREASE (* WIDTH 1/3))
(define DECREASE (* WIDTH 1/5))

; HappyState is a Number
; interpretation the happiness represented
; as the number of px wide a red rectangle is
  

; HappyState -> Image
; draws a red rectangle to represent the
; current happiness
(check-expect
 (render 90) (overlay/align
              "left" "center"
              (rectangle 90 HEIGHT "solid" "red")
              BACKGROUND))
(check-expect
 (render 50) (overlay/align
              "left" "center"
              (rectangle 50 HEIGHT "solid" "red")
              BACKGROUND))
(define (render hs)
  (overlay/align "left" "center"
                 (rectangle hs HEIGHT "solid" "red")
                 BACKGROUND))

; HappyState -> HappyState
; decrements the HappyState counter by
; 0.1 every single clock tick until it reaches zero
(check-expect (tock 10) 9.9)
(check-expect (tock 20) 19.9)
(check-expect (tock 38) 37.9)
(check-expect (tock 54.4) 54.3)
(define (tock hs)
  (cond
    [(<= (- hs 0.1) 0) 0]
    [else (- hs 0.1)]))

; HappyState -> HappyState
; forces the values between 0 and WIDTH
(check-expect (sanitize 150) 100)
(check-expect (sanitize 58) 58)
(check-expect (sanitize -2) 0) 
(define (sanitize hs)
  (cond
    [(> hs 100) 100]
    [(< hs 0) 0]
    [else hs]))

; HappyState String -> HappyState
; handles the key-press event
; when up arrow key is pressed happiness increases by 1/3
; when down arrow key is pressed happiness decreases by 1/5
; every clock tick happiness decreases by 0.1, stopping at 0
(check-expect (key-pressed 50 "up") (+ 50 INCREASE))
(check-expect (key-pressed 50 "down") (- 50 DECREASE))
(check-expect (key-pressed 95 "up") 100)
(check-expect (key-pressed 5 "down") 0) 
(define (key-pressed hs ke)
  (cond
    [(key=? ke "up") (sanitize (+ hs INCREASE ))]
    [(key=? ke "down") (sanitize (- hs DECREASE))]
    [else hs]))

; HappyState -> HappyState
; a program for drawing a happiness meter
; happiness starts at H
(define (gauge-prog H)
  (big-bang H
    [to-draw render]
    [on-tick tock]
    [on-key key-pressed]))