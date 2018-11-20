#lang racket

(define(leaf? tree)
  (cond
    [(empty? (cdr tree)) true]
    [else false]))

(define(children tree)
  (cdr tree))

(define(add-nodes tree acum)
  (if(leaf? tree)
     (+ acum (car tree))
     ;;(let((m (+ (car tree) acum))))
     (count_leaves_in_forest(children tree) (car tree))))

(define(count_leaves_in_forest forest acum)
  (if(null? forest)
     0
     (+ (add-nodes (car forest) acum)(count_leaves_in_forest (cdr forest) 0))))

(define(add-tree tree)
  (add-nodes tree 0))

(add-tree'(1(2(3)(4))(5(6)(7))))