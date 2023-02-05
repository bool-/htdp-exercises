;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-058) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; constants
(define HIGH-TAX-RATE 0.08)
(define LOW-TAX-RATE 0.05)
(define UPPER-BOUND-LOW-TAX 10000)
(define LOWER-BOUND-LOW-TAX 1000)

; A Price falls into one of three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.
; interpretation the price of an item

; Price -> Number
; computes the amount of tax charged for p
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 1282) (* 0.05 1282))
(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 12017) (* 0.08 12017))
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p LOWER-BOUND-LOW-TAX)) 0]
    [(and (<= LOWER-BOUND-LOW-TAX p) (< p UPPER-BOUND-LOW-TAX)) (* LOW-TAX-RATE p)]
    [(>= p UPPER-BOUND-LOW-TAX) (* HIGH-TAX-RATE p)]))