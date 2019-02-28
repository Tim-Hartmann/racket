;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 18b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (mult '(2 3 4) '(7 8 9)) '(14 24 36))

;; lo-number , lo-number -> lo-number
(define mult (λ [loa1 loa2]
               (cond [(empty? loa1) loa1]
                     [else (cons (* (first loa1) (first loa2))
                                 (mult (rest loa1)(rest loa2)))])))


