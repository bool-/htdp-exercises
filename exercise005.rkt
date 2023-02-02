;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ex 5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; proportions
(define s 1.5)
(define px 100)
(define trunk-height (/ px 2)) 
(define trunk-width (/ px 4))

; dimensions
(define width 300)
(define height 300)

(overlay
 (overlay/offset
  (overlay/offset
   (triangle px "solid" "green")
   0 (/ px s)
   (triangle (* px s) "solid" "green"))
  0 px
  (rectangle trunk-width trunk-height "solid" "brown"))
 (rectangle width height "solid" "blue"))