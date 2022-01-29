(define (_gcd n m)
  (if (= m 0)
      n
      (_gcd m (remainder n m))))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;(define (make-rat n d)
;  (let ((g (_gcd n d)))
;    (cons (/ n g) (/ d g))))
;(define (numer x) (car x))
;(define (denom x) (cdr x))

(define (make-rat n d) (cons n d))
(define (numer x)
  (let ((g (_gcd (car x) (cdr x))))
    (/ (car x) g)))
(define (denom x)
  (let ((g (_gcd (car x) (cdr x))))
    (/ (cdr x) g)))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))

;(car (cdr z))
;(cdr (car z))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat (div-rat one-half one-third))
(print-rat (add-rat one-third one-third))


