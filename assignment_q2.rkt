#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

(define (ins_beg el lst)
  (append (list el) lst)
  )

(define (ins_end el lst)
  (append lst (list el))
  )

(define (count_top_level lst)
  (cond [(null? lst) 0]
   [(+ 1 (count_top_level(cdr lst)))])
     
  )

(define (count_instances val1 lst)
  (cond [(null? lst) 0]
        [(= val1 (car lst)) (+ 1 (count_instances val1 (cdr lst)))]
        [else (count_instances val1 (cdr lst))]
        )
  )

(define (count_instances_tr_assistant val1 lst output)
   (cond [(null? lst) output]
        [(= val1 (car lst)) (count_instances_tr_assistant val1 (cdr lst) (+ 1 output))];adding + 1 to the start still works
        [else (count_instances_tr_assistant val1 (cdr lst) output)]
        )
  )

(define (count_instances_tr val1 lst)
  (count_instances_tr_assistant val1 lst 0)
  )

(define (count_instances_deep_assistant lst output); come back to it
  (cond
    [(null? lst) output]
    [(list? car lst) (count_instances_deep_assistant (car lst) (+ 1 output))]
    [else (count_instances_deep_assistant (cdr lst) (+ 1 output))]
        )
  )

(define (count_instances_deep lst)
  (count_instances_deep_assistant lst 0)
  )

