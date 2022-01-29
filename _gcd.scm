(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 2 8)

(define (_gcd n m)
  (if (= m 0)
      n
      (_gcd m (remainder n m))))

(_gcd 28 16)
