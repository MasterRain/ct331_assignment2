#lang racket

(define (print_tree tree)
  (cond [(null? tree) (display "")]
        [else (begin
                (unless (empty? (car tree)) (print_tree (car tree)))  
                (display (cadr tree))
                (unless (empty?(caddr tree)) (print_tree (caddr tree)))
                )]
        )
  )

(define (search_tree tree item)
  (cond [(equal? (cadr tree) item) #t]
        [(> (cadr tree) item) (if(empty? (car tree)) #f (search_tree (car tree) item))]
        [(< (cadr tree) item) (if(empty? (caddr tree)) #f (search_tree (caddr tree) item))]
        )
  )

(define (insert_tree tree item)
  (cond [(empty? tree) (append tree '() item '())]; insert into a list
        [(> (cadr tree) item) (search_tree (car tree) item)]
        [(< (cadr tree) item) (search_tree (caddr tree) item)]
        )
  )

(define (insert_tree_list tree lst)
  (cond [(empty? list) "done"]
        [else (begin
                (insert_tree tree (car lst))
                (insert_tree_list tree (cdr lst))
                )]
        )
  )

(define (tree_sort lst)
  (tree_sort_helper lst '())
  )

(define (tree_sort_helper lst output)  
   (begin
      (insert_tree_lst output lst)
      (print_tree output) 
    )
  )


  