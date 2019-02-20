;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 17g) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t write repeating-decimal #f #t none #f () #f)))

;; atom, list-of-tuple -> bool
;; prüft, ob das gegebene atom das erste element einer der tupel ist.
(check-expect (isInTuple? 'a '((a 1)(b 1))) #true)
(check-expect (isInTuple? 'a '((b 1))) #false)
(check-expect (isInTuple? 'a '((b 1)(a 1))) #true)
(check-expect (isInTuple? 'a '()) #false)
(define isInTuple? (lambda [a l]
                    (cond [(empty? l) false]
                          [(equal? (first (first l)) a) true]
                          [else (isInTuple? a (rest l))])))


;; atom, list-of-tuple -> list-of-tuple
;; Erhöht den Wert des 2. Elements desjenigen Tupels, dessen 1. Element dem geg. Atom gleicht
;; Annahme: Ein Atom taucht nicht mehr als 1 mal auf
(check-expect (countup 'c '((a 1)(b 1)(c 4)))
              '((a 1) (b 1) (c 5)))
(check-expect (countup 'b '((a 1)(b 1)))
              '((a 1) (b 2)))
(define countup (lambda [a l]
                  (cond [(equal? (first (first l)) a)
                         (cons (list a
                                     (+ (second (first l)) 1))
                               (rest l))]
                        [else (cons (first l) (countup a (rest l)))])))


;; list-of-atom -> list-of-tuple
;; Nehme eine Liste von Atomen und gib eine Liste von Tuplen bestehend aus Atom und der zugehörigen häufigkeit zurück
(check-expect (frequencies '(a c a b b b) empty)
              '((b 3) (c 1) (a 2)))
(check-expect (frequencies '(a a a b b b) empty)
              '((b 3) (a 3)))
(define frequencies (lambda [al tl]
                      (cond [(empty? al) tl]
                            [(isInTuple? (first al)
                                         tl)
                             (frequencies
                              (rest al)
                              (countup (first al) tl))]
                            [else
                             (frequencies (rest al)
                                          (cons (list (first al) 1) tl))])))