(define (split-at lst n)
  'YOUR-CODE-HERE
  (cond 
    ((null? lst)
     (list '()))
    ((> n (length lst))
     (list lst))
    ((zero? n)
     (append (list '()) lst))
    (else
     (cons (cons (car lst)
                 (car (split-at (cdr lst) (- n 1))))
           (cdr (split-at (cdr lst) (- n 1)))))))

(split-at '(1 2 3 4 5) 10)

(define (compose-all funcs) 
'YOUR-CODE-HERE
  (lambda (x)
    (if (null? funcs)
        x
        ((compose-all (cdr funcs)) ((car funcs) x))))
)
