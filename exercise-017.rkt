;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname execise-017) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require htdp/image)

(define rect-wide (rectangle 100 50 "solid" "blue"))
(define rect-tall (rectangle 50 100 "solid" "blue"))
(define rect-square (rectangle 100 100 "solid" "blue"))

(define (image-classify image)
  (if (= (image-height image) (image-width image))
      "square"
      (if (>= (image-height image) (image-width image)) "tall" "wide")))

(image-classify rect-wide) ; "wide"
(image-classify rect-tall) ; "tall"
(image-classify rect-square) ; "square"