;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-035) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> 1String
; given s, extract the last 1String
; given "foo", expect: "o"
; given "bar", expect: "r"
; given "baz", expect: "z"
(define (string-last s)
  (substring s (- (string-length s) 1)))

; > (string-last "foo")
; "o"
; > (string-last "bar")
; "r"
; > (string-last "baz")
; "z"