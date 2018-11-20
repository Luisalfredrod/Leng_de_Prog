#lang racket
;; Functions seen in class
(define (children tree)
  (cdr tree)
  )

(define (leaf? tree)
  (cond
    [(empty? (cdr tree)) true]
    [else false]))


;;deep-all-x
(define (deep-all-x? tree x)
  (all-x? (flatten tree) x))

(define (all-x? tree x)
  (cond
    [(empty? tree) false]
    [else (comp tree x)]))


(define (comp tree x)
  (cond
    [(empty? tree) true]
    [(= (car tree) x)(comp (children tree) x)]
    [else false]))

;; Deep reverse
(define (deep-reverse tree)
  (if (list? tree)
      (reverse (map deep-reverse tree)) tree))

(deep-reverse '(a (b (c d)) e (f g)))


;;Flatten

(define (flatten tree)
  (cond
    [(null? tree) '()]
    [(pair? tree) (append (flatten (car tree)) (flatten (cdr tree)))]
    [else (list tree)]))

(flatten '(a (b (c d)) e (f g)))



;; Level Count (done in class)

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
     (max (+ 1 (max-depth (car forest))) (count_levels (children forest)))
    ]
  )
)

(max-depth '(a(b(c)(d))(e(f)(g)))) 


;;count-max-arity

(define (count-max-arity tree)
  (cond
    [(empty? tree) 0]
    [(acum (children tree) 0)]))

(define (acum tree x)
  (cond
    [(empty? tree) x]
    [(max (acum (cdr(car tree)) 0) (acum (children tree) (+ 1 x)))]))

(count-max-arity '(a(b(c)(d))(e(f)(g)(h)(i)))) 

