;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 17h) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t write repeating-decimal #f #t none #f () #f)))
(check-expect (abse 2 '(2 5 7)) 0)
(check-expect (abse 4 '(2 5 7)) 1)
(check-expect (abse 8 '(2 5 7)) 2)
(check-error (abse 15 '(2 5 7))) 	

(define abse (λ [sum lvz]
               (cond [(empty? lvz) (error 'abse "Wert wurde nicht erreicht")]
                     [(> sum (first lvz)) (+ 1 (abse (- sum (first lvz)) (rest lvz)))]
                     [else 0])))