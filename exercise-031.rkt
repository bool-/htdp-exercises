;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-031) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define (letter fst lst signature-name)
  (string-append
    (opening fst)
    "\n\n"
    (body fst lst)
    "\n\n"
    (closing signature-name)))
 
(define (opening fst)
  (string-append "Dear " fst ","))
 
(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

; > (write-file "fst.dat" "Blue")
; "fst.dat"
; > (write-file "lst.dat" "Johnson")
; "lst.dat"
; > (write-file "signature.dat" "Smith")
; "signature.dat"
; > (main "fst.dat" "lst.dat" "signature.dat" "letter.dat")
; "letter.dat"
; > (write-file 'stdout (read-file "letter.dat"))
; Dear Blue,
; 
; We have discovered that all people with the
; last name Johnson have won our lottery. So, 
; Blue, hurry and pick up your prize.
;
; Sincerely,
;
; Smith'stdout
