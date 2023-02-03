;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-038) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; return a string with the last character removed from s
; given: "foo", expect "fo"
; given: "bar", expect "ba"
; given: "baz", expect "ba"
; given: "qux", expect "qu"
(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))

; > (string-remove-last "foo")
; "fo"
; > (string-remove-last "bar")
; "ba"
; > (string-remove-last "baz")
; "ba"
; > (string-remove-last "qux")
; "qu"