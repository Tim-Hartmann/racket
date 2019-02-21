;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 18c) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (merge '(2 5 7) '(1 3 5 9)) '(1 2 3 5 5 7 9))
(check-expect (merge '(1 2 9) '(4 5 6 7)) '(1 2 4 5 6 7 9))
(check-expect (merge '() '() ) '())
(check-expect (merge '(1) '()) '(1))


(define merge (λ [loa1 loa2]
                (cond [(empty? loa1) loa2]
                      [(empty? loa2) loa1]
                      [(< (first loa1) (first loa2))
                       (cons (first loa1) (merge (rest loa1) loa2))]
                      [else (cons (first loa2) (merge (rest loa2) loa1))])))