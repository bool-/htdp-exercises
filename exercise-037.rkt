;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-037) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; return a string with the first character removed from s
; given: "foo", expect: "oo"
; given: "bar", expect: "ar"
; given: "baz", expect: "az"
(define (string-rest s)
  (substring s 1))

; > (string-rest "foo")
; "oo"
; > (string-rest "bar")
; "ar"
; > (string-rest "baz")
; "az"