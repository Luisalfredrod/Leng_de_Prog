#lang racket

;;comments bla bla bla

(define (iterest amount)
  (cond
    [(<= amount 1000) 0.040]
    [(<= amount 5000) 0.045]
    [(<= amount 6000) 0.050]))

(+ 2 3)

(define (sum v b)
  (+ v b))

;; call on lambda
(lambda (v b) (+ v b))

;; sum with lambda
(define suml (lambda (a b)
               (+ a b)))

(define (mult a b)
  (* a b))

(define (square a)
  (expt a 2))


;; lists

;; Makes a list with two elements '( a b )
(define( addlist a b)
  (cons a (cons b empty)))

;; add a element to a list in the begining
(define (add1 a)
  (cond
    [(empty? a) 0]
    [else (+ (car a) (add1 (cdr a)))]))


;; Invert with dots
(define (inv l)
  (cond
    [(empty? l) '()]
    [else (addLast (inv (cdr l))(car l))]))

;; Add last
(define(addLast l x)
  (cond
    [(empty? l)(cons x empty)]
    {else (cons (car l) (addLast (cdr l) x))}))


;; Count elements in list

(define (counter1 l)
  (counter2 l 0))

(define (counter2 l x)
  (cond
    [(empty? l) x]
    [else (counter2 (cdr l) (+ x 1))]))


;;mutual recursion count leafs in trees

(define (leaf? tree)
  (cond
    [(empty? (cdr tree)) true]
    [else false]))

(define (children tree)
  (cdr tree))

(define (count_leaves tree)
  (if (leaf? tree)
      1
      (count_leaves_in_forest (children tree))))

(define (count_leaves_in_forest forest)
  (if (null? forest)
      0
      (+ (count_leaves (car forest))
         (count_leaves_in_forest (cdr forest)))))


(define (map f l)
  (if (null? l)
      '()
      (cons(f(car l))(map f (cdr l)))))


;; Quick sort of a tree
(define (quick-sort alon)
  (cond
    [(empty? alon) empty]
    [else (append (quick-sort (smaller-items alon (first alon)))
                  (list (first alon))
                  (quick-sort (larger-items alon (first alon))))]))

(define (larger-items alon threshold)
  (cond
    [(empty? alon) empty]
    [else (if (> (first alon) threshold)
                 (cons (first alon) (larger-items (rest alon) threshold))
                 (larger-items (rest alon) threshold))]))

(define (smaller-items alon threshold)
    (cond
    [(empty? alon) empty]
    [else (if (> (first alon) threshold)
                 (cons (first alon) (smaller-items (rest alon) threshold))
                 (smaller-items (rest alon) threshold))]))




(define (max-depth tree)
  (cond
    ;;if it is leave it will add 1
    [(leaf? tree) 1]
    ;;else it will go down
    [else (count_levels (children tree))]
   )
)

(define (count_levels forest)
  (cond
    ;;if the forest is empty then it has 0 deep
    [(empty? forest) 0]
    [else
     ;; max deep of the first tree vs the rest of the trees.
     (max (+ 1 (max-depth (first forest))) (count_levels (children forest)))
    ]
  )
)

(max-depth '(100(100(3)(4))(100(3))))
