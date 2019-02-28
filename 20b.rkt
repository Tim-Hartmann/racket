;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 20b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t write repeating-decimal #f #t none #f () #f)))
(check-expect (diff '(add x x) 'x) '(add 1 1))
(check-expect (diff '(add x y) 'x) '(add 1 0))
(check-expect (diff '(mul x x) 'x) '(add (mul x 1) (mul 1 x)))
;; diff: los s -> los
;; Leite eine beliebig tiefgeschachtelte Funktion nach x ab.
(define diff (λ [fun x]
               (letrec [(operation (λ [f] (first f)))
                        (operands (λ [f] (rest f)))]
                 (cond [(cons? fun) ;; Es ist eine Funktion
                        (cond [(equal? (operation fun) 'add);;Ableitung der Addition
                                                            ;;ist Addition der abgeleiteten Operanden
                               (list 'add
                                     (diff (first (operands fun)) x)
                                     (diff (second (operands fun)) x))]
                              
                              [(equal? (operation fun) 'mul);;Ableitung der Multiplikation
                               (list 'add
                                     (list 'mul
                                           (first (operands fun))
                                           (diff (second (operands fun)) x))
                                     (list 'mul
                                           (diff (first (operands fun)) x)
                                           (second (operands fun))))])]
                       
                       ;; Es ist ein Atom; wenn nach ihm abgeleitet werden soll 1, sonst 0
                       [else (if (equal? fun x) 1 0)]))))