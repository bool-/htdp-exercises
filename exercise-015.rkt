;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-015) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (==> sunny friday)
  (or (not sunny) friday))

(==> #false #false) ; should be true
(==> #true #true) ; should be true
(==> #false #true) ; should be true
(==> #true #false) ; should be false