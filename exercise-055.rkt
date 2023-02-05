;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-055) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; dimensions for the background scene
(define HEIGHT 300)
(define WIDTH 100)

; the change in y-axis location of the rocket per clock tick
(define YDELTA 3)

; graphics
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

; calcualted center of the rocket
(define CENTER (/ (image-height ROCKET) 2))

; rocket x location
(define ROCKET-X (/ WIDTH 2))

; An LRCD (for launching rocket countdown) is one of:
; – "resting"
; – a Number between -3 and -1
; – a NonnegativeNumber 
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)

; Number -> Image
; renders the rocket at the specified y location
(check-expect
 (show-rocket HEIGHT) (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))
(check-expect
 (show-rocket 50) (place-image ROCKET 10 (- 50 CENTER) BACKG))
(define (show-rocket y)
  (place-image ROCKET 10 (- y CENTER) BACKG))

; LRCD -> Image
; renders the state as a resting or flying rocket
(check-expect
 (show "resting")
 (show-rocket HEIGHT))
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (show-rocket HEIGHT)))
(check-expect
 (show HEIGHT)
 (show-rocket HEIGHT))
(check-expect
 (show 53)
 (show-rocket 53))
(define (show x)
  (cond
    ; using (string=? "resting" x) as the first condtion
    ; would result in an exception when x is a Number
    ; we want to check it's a String and check if it's "resting"
    [(and (string? x) (string=? "resting" x))
     (show-rocket HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (show-rocket HEIGHT))]
    [(>= x 0)
     (show-rocket HEIGHT)]))
 
; LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed, 
; if the rocket is still resting 
(define (launch x ke)
  x)
 
; LRCD -> LRCD
; raises the rocket by YDELTA,
;  if it is moving already 
(define (fly x)
  x)