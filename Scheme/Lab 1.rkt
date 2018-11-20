#lang racket


;; Define creates a function areatri is the name of the function and B & H are base and hight.
;; The function follows the formula to calculate the area of a triangle (B*H)/2 
(define(areatri b h)
  (/ (* b h)2))

;; As mentioned before ex1 is the name of the functuion and calculates n2+10
(define(ex1 n)
  (+ 10 (expt n 2)))

;; Calculates (1/2) * n2 + 20
(define(ex2 n)
  (+ (* (/ 1 2) (expt n 2)) 20))

;; Calculates 2 - (1/n)
(define(ex3 n)
  (- 2 (/ 1 n)))

;; Method 1
;; Compare the values of the discriminant as b2 (< or > or =) 4*ac to get the number of possible solutions.
(define(cuad  a b c)
  (cond
    [(> (* b b) (* 4 (* a c))) 2]
    [(= (* b b) (* 4 (* a c))) 1]
    [(< (* b b) (* 4 (* a c))) 0]))

;; Calculation of the discriminant to get a value either equal, greater or less than 0.
(define(des a b c)
  (- (* b b) (* 4 (* a c))))

;; Method 2
;; Compares the result from the function des to calculate the possible number of solutions.
(define(cuad2  a b c)
  (cond
    [(> (des a b c) 0) 2]
    [(= (des a b c) 0) 1]
    [(< (des a b c) 0) 0]))

