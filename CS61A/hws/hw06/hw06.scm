(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cdr (cdr s)))
)


(define (sign num)
  ; 'YOUR-CODE-HERE
  (cond
    ((> num 0) 1)
    ((< num 0) -1)
    (else 0)
  )
)


(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (cond
    ((= y 0) 1)
    ((= y 1) x)
    ((= (modulo y 2) 0) (square (pow x (quotient y 2))))
    (else (* x (square (pow x (quotient y 2)))))
  )
)

