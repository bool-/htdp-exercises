;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-016) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require htdp/image)

(define rect (rectangle 50 100 "solid" "blue"))
(define square (rectangle 100 100 "solid" "blue"))

(define (image-area image)
  (* (image-width image) (image-height image)))

(image-area rect) ; 5000
(image-area square) ; 10000