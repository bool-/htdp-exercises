;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-027) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define base-attendace 120)
(define base-price 5.0)
(define average-attendence-increase 15)
(define ticket-price-increase 0.1)

(define fixed-cost 180)
(define cost-per-person 0.04)

(define (attendees ticket-price)
  (- base-attendace
     (* (- ticket-price base-price)
        (/ average-attendence-increase ticket-price-increase))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* cost-per-person (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))