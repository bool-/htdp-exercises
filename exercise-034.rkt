;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-034) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> 1String
; given s, extract the first 1String
; given: "foo" for s, expect: "f"
; given: "bar" for s, expect: "b"
; given: "baz" for s, expect: "b"
; given: "qux" for s, expect: "q"
(define (string-first s)
  (substring s 0 1))

; > (string-first "foo")
; "f"
; > (string-first "bar")
; "b"
; > (string-first "baz")
; "b"
; > (string-first "qux")
; "q"