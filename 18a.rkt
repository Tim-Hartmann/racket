;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 18a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; concatenate: (list-of atom , list-of atom)
;;              -> (list-of-atom)
(check-expect (concatenate '(a b c) '(d e f)) '(a b c d e f))
(define concatenate (λ [loa1 loa2]
                      (cond [(empty? loa1) loa2]
                            [else (cons (first loa1)
                                        (concatenate (rest loa1) loa2))])))
