;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 22a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (sum '(1 2 3 4 5 6 7 8 9)) 45)

(define sum
  (λ [list]
    (letrec
        ([sum-iter
          (λ [listX akku]
            (cond 
              [(empty? listX) akku]
              [else (sum-iter (rest listX) (+ (first listX) akku))]))])
      (sum-iter list 0))))

;; Akkumulatorinvariante
;; akku ist die Summe der Elemente con list, die denen von listX vorangehen
