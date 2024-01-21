(define (caar x) (car (car x)))

(define (cadr x) (car (cdr x)))

(define (cdar x) (cdr (car x)))

(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement
(define (zip pairs)
  (cond 
    ((null? pairs)
     '(() ()))
    (else
     (define ret (zip (cdr pairs)))
     (cons (cons (caar pairs) (car ret))
           (list (cons (car (cdar pairs)) (cadr ret)))))))

(zip '((1 2) (3 4) (5 6)))

; expect ((1 3 5) (2 4 6))
; ; Problem 15
; ; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (change s depth)
    (cond 
      ((null? s)
       '())
      (else
       (cons (list depth (car s))
             (change (cdr s) (+ depth 1))))))
  (change s 0))

; END PROBLEM 15
; ; Problem 16
; ; Merge two lists LIST1 and LIST2 according to COMP and return
; ; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond 
    ((null? list1)
     list2)
    ((null? list2)
     list1)
    ((comp (car list1) (car list2))
     (cons (car list1) (merge comp (cdr list1) list2)))
    (else
     (cons (car list2) (merge comp list1 (cdr list2))))))

; END PROBLEM 16
(merge < '(1 5 7 9) '(4 8 10))

; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))

; expect (10 9 8 7 5 4 3 1)
; ; Problem 17
(define (nondecreaselist s)
  ; BEGIN PROBLEM 17
  (cond 
    ((null? s)
     '())
    ((null? (cdr s))
     (list s))
    ((> (car s) (cadr s))
     (cons (list (car s)) (nondecreaselist (cdr s))))
    (else
     (cons (append (list (car s))
                   (car (nondecreaselist (cdr s))))
           (cdr (nondecreaselist (cdr s)))))))

; END PROBLEM 17
; ; Problem EC
; ; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))

(define define? (check-special 'define))

(define quoted? (check-special 'quote))

(define let? (check-special 'let))

; ; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond 
    ((atom? expr)
     ; BEGIN PROBLEM EC
     expr
     ; END PROBLEM EC
    )
    ((quoted? expr)
     ; BEGIN PROBLEM EC
     ; (car (cdr expr))
     'isquoted
     (cons 'quote (cons (car (cdr expr)) '()))
     ; END PROBLEM EC
    )
    ((or (lambda? expr) (define? expr))
     (let ((form (car expr))
           (params (cadr expr))
           (body (cddr expr)))
       ; BEGIN PROBLEM EC
       (define ret (let-to-lambda body))
       (cons form
             (cons params (cons (car ret) (cdr ret))))
       ; END PROBLEM EC
     ))
    ((let? expr)
     (let ((values (cadr expr))
           (body (cddr expr)))
       ; BEGIN PROBLEM EC
       (define dict (zip (let-to-lambda values)))
       (define ret (let-to-lambda body))
       (cons (cons 'lambda
                   (cons (car dict) (cons (car ret) (cdr ret))))
             (cadr dict))
       ; END PROBLEM EC
     ))
    (else
     ; BEGIN PROBLEM EC
     (cond 
       ((symbol? expr) expr)
       ((atom? expr)   (expr))
       ((list? expr)   (map let-to-lambda expr)))
     ; END PROBLEM EC
    )
  )
)
