#lang racket

(define (combine val1 val2)
  (cons val1 val2)
  )

(define (list3 val1 val2 val3)
  (cons val1 (cons val2 (cons val3 '())))
  )

(define (consList val1 val2 val3)
  (cons val1 (cons val2 (cons val3 '())))
  )

(define (listList val1 val2 val3)
  (list val1 val2 val3)
  )

(define (appendList val1 val2 val3)
  (append (list val1) (list val2) (list val3))
  )

(combine 5 7)
(list3 1 9 7)
(consList "banana" 1 '(9 5 7))
(listList "the krabby patty formula" 17 '(3 2 6))
(appendList "tacocat" 42 '( 1 23 4))