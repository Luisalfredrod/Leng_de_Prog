#lang racket
;;(power-head 4 3) should return 64
(define (power-head a b)
  (cond
    [(= b 0) 1]
    [else (* a (power-head a (- b 1)))]))
    

;; (power-tail 4 3) should return 64
(define(power-tail a b)
  (calc2 a b a 1))

(define(calc2 a b acu cont)
  (cond
    [(= b 0) 1] 
    [(= cont b) acu]
    [else (calc2 a b (* a acu) (+ cont 1))]))

;;(third (cons 1(cons 2 (cons 3 (cons 4 (cons 5 empty)))))) should return 3
(define(third l)
  (find l 0))

(define(find l acu)
  (cond
    [(= acu 2) (car l)]
    [else (find (cdr l)(+ acu 1))]))

;;(just-two? (cons 1 empty))

(define(just-two l)
  (cond
   [(= (count l 0) 2) (write "#t")]
   [else (write "#f")]))

(define (count l x)
  (cond
    [(empty? l) x]
    [else (count (cdr l) (+ x 1))]))
  

;;how-many-x?

(define (how-many-x l x)
  (countx l x 0))

(define(countx l x acu)
  (cond
    [(empty? l) acu]
    [(= x (car l)) (countx(cdr l) x (+ acu 1))]
    [else (countx(cdr l) x acu)]))

;;all-x

(define (all-x l x)
  (cond 
   [(> (countx l x 0) 0) true]
   [else false]))

;;get list

(define (get-list l x)
  (posfind l x 1))

(define(posfind l x acu)
  (cond
    [(= x (car l)) acu]
    [else (posfind(cdr l) x (+ 1 acu))]))

;;difference
(define(difference a b)
  (cond
    [(empty? a)'()]
    [(not (member (car a) b)) (cons (car a) (difference (cdr a) b))]
    [else(difference (cdr a) b)]))

(difference '(12 44 55 77 66 1 2 3 4) '(1 2 3))

;;append
(define(append a b)
  (cond
    [(empty? a)'()]
    [not (member (car a) b) (cons (car a) (append (cdr a) b))]
    [else(append (cdr a) b)]))
 (append  '(a b c) '(d e f))

;; Invert (seen in class)
(define (inv l)
  (cond
    [(empty? l) '()]
    [else (addLast (inv (cdr l))(car l))]))

(define(addLast l x)
  (cond
    [(empty? l)(cons x empty)]
    {else (cons (car l) (addLast (cdr l) x))}))

(inv '(a b c d))

;;Sign


(define(sign l)
  (cond
    [(empty? l) '()]
    [(< 0 (car l)) (cons 1 (sign (cdr l)))]
    [else (cons -1 (sign (cdr l)))]))

(sign '(2 -4 -6))

;;Negatives

(define(negative l)
    (cond
    [(empty? l) '()]
    [(< 0 (car l)) (cons(* (car l) -1) (negative (cdr l)))]
    [else (cons(car l) (negative (cdr l)))]))

(negative '(2 -4 6))

