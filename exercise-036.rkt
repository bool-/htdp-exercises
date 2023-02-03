;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-036) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Image -> Number
; compute the number of pixels in img
; given: (empty-scene 100 100)
; expect: 10000
; given: (empty-scene 100 50)
; expect: 5000
; given: (empty-scene 75 75)
; expect: 5625
(define (image-area img)
  (* (image-width img) (image-height img)))

; > (image-area (empty-scene 100 100))
; 10000
; > (image-area (empty-scene 100 50))
; 5000
; > (image-area (empty-scene 75 75))
; 5625