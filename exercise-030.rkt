;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-030) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define BASE-ATTENDANCE 120)
(define BASE-PRICE 5.0)
(define AVERAGE-ATTENDANCE-INCREASE 15)
(define TICKET-PRICE-INCREASEe 0.1)

(define PRICE-SENSITIVITY (/ AVERAGE-ATTENDANCE-INCREASE TICKET-PRICE-INCREASEe))

(define FIXED-COST 0)
(define COST-PER-PERSON 1.50)

(define (attendees ticket-price)
  (- BASE-ATTENDANCE
     (* (- ticket-price BASE-PRICE)
        PRICE-SENSITIVITY)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* COST-PER-PERSON (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)

(profit 2.9) ; max profit
(profit 2.8)
(profit 2.7)

; just for comparison
(define (profit.ugly price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (* 1.50
        (+ 120
           (* (/ 15 0.1)
              (- 5.0 price))))))

(define (comp-price price)
  (= (profit price) (profit.ugly price)))

(comp-price 3)
(comp-price 4)
(comp-price 5)