;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |23|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; a
(check-expect (add42 '(0 1 2 3)) '(42 43 44 45))
(define add42 (λ [lvz]
                (map (λ [x](+ x 42))
                     lvz)))
;; b
(check-expect (filtergerade '(0 1 2 3)) '(42 44))
(define filtergerade (λ [lvz]
                       (filter even? (add42 lvz))))
;; c
(check-expect (prodd '(0 1 2 3)) 1848)
(define prodd (λ [lvz]
                (foldr * 1 (filtergerade lvz))))
;; d
(check-expect (elimnicht4u5 '(1 4 5 10 11 12 15 21)) '(4 5 10 12 15))
(define elimnicht4u5 (λ [lvz]
                  (filter (λ [x](cond [(= (modulo x 4) 0) true]
                                      [(= (modulo x 5) 0) true]
                                      [else false]))
                            lvz)))
;; e
(check-expect (sumquad '(1 2 3)) 14)
(define sumquad (λ [lvz]
                  (foldr + 0 (map (λ [x](* x x)) lvz))))
;; f
(check-expect (und '(#true #true #true)) #true)
(check-expect (und '(#true #false #true)) #false)
(define und (λ [lvz]
              (foldr (λ [a b](and a b)) #true lvz)))
;; g
(check-expect (partitioniere '(1 2 3 4 5) (λ [x](< x 4))) '((1 2 3)(4 5)))
(define partitioniere (λ [lvz praed]
                        (list (filter praed lvz) (filter (λ [x](if (praed x) #false #true)) lvz))))
;; h
(check-expect (ssort '(1 2 3)) '(3 2 1))
(define switchnumbers (λ [a b](if (> a b) (list a b) (list b a))))
(define merge (λ [loa1 loa2]
                (cond [(empty? loa1) loa2]
                      [(empty? loa2) loa1]
                      [(> (first loa1) (first loa2))
                       (cons (first loa1) (merge (rest loa1) loa2))]
                      [else (cons (first loa2) (merge (rest loa2) loa1))])))
(define ssort (λ [lvz]
                (cond [(< (length lvz) 2) lvz]
                      [else (merge (switchnumbers (first lvz)(second lvz))
                                   (ssort (rest (rest lvz))))])))
