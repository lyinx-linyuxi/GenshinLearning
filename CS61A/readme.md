# CS61A: Structure and Interpretation of Computer Programs

semester: **Fall 2020**

language: **python**, **scheme** and some **SQL(SQLite)**

website:[https://inst.eecs.berkeley.edu/~cs61a/fa20/](https://inst.eecs.berkeley.edu/~cs61a/fa20/)

## elaboration

- finish all the optional problems
- scehme lab is not the harder one

## difficulties

- use **recurssion** not **iteration**, all **iterations** can be done using **recurssion**
- learning a new language **scheme**, especially the extra credit problem in scheme lab which took me almost 1 day to solve.(thinking independently before seeking help is highly recommended because the problem is worth thinking)

## Hidden Bug

Too deceptive😫

### pjs

#### scheme

in file *scheme_buitin.py* the provided function **display** donot work well

```python
@builtin("display")
def scheme_display(*vals):
    vals = [repl_str(val[1:-1] if scheme_stringp(val) else val) for val in vals]
    print(*vals, end="")
```

you can see the **display** call **print** python-builtin function

However, if you use ```print("DEBUG: "....)``` statement to debug while building the project, it will also print something

where i find the bug:

```lisp
(define (make-rat n d) (list n d))
(define (numer x) (car x))
(define (denom x) (car (cdr x)))
(define (print-rat x)
  (display (numer x))
  (display '/)
  (display (denom x))
  (newline))
(define one-half (make-rat 1 2))
(print-rat one-half)
; expect 1/2

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
; expect 5/6

(print-rat (mul-rat one-half one-third))
; expect 1/6

(print-rat (add-rat one-third one-third))
; expect 6/9

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (make-rat n d)
  (let ((g (gcd n d)))
    (list (/ n g) (/ d g))))
(print-rat (add-rat one-third one-third))
; expect 2/3
```

Then the 'bug' appears: ok does not recognize the output with "DEBUG :" prefix as wrong output, but it actually output something which takes a new line.When you call **display** it would first evaluate the argument, while evaluating the ```print("DEBUG: ")``` sentence is also printing.

if you are using ok to test other functions, its fine, because all the debug information takes a newline and with a special prefix, it does not affect the final output

However if you are testing **display** things changes.

```python
print("DEBUG: ")
print("DEBUG: ")
print("DEBUG: ")
print("ret1", end="") # display call print
print("DEBUG: ")
print("ret2", end="") # display call print
print("DEBUG: ")
print("ret3", end="") # display call print

# while evaluating tht debug information also print(if there is and the output is depending on how many and whether it is print)
# the example output:
# DEBUG: 
# DEBUG:
# DEBUG:
# ret1DEBUG:
# ret2DEBUG:
# ret3 ; this line is the final output
```

So, while testing **display**, you should ensure the no newline happens.The easiest solution is to comment or delete all debug information.