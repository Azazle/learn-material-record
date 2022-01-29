(define BOMB (error 'not "defined"))
(define (subl x) (- x 1))

#|
(define (fact n)
  (if (zero? n)
      1
      (* n ((lambda (n)
              (if (zero? n)
                  1
                  (* n (BOMB (subl n)))))
              (subl n)))))
;(fact 1)
;(fact 2)
|#

#|
(define mk-fact
  (lambda (f)
    ((lambda (factorial)
       (lambda (n)
         (if (zero? n)
             1
             ;(* n ((f BOMB) (subl n)))))))
             (* n (factorial (subl n))))))
     (f f))))

(define fact-bomb (mk-fact mk-fact))
(fact-bomb 10)
|#

(define Y
  (lambda (g)
    ((lambda (f)
       (f f))
     (lambda (f)
       (g (f f))))))

;(Y F) = (F (Y F))

(define fact
  (Y
   (lambda (factorial)
     (lambda (n)
       (if (zero? n)
           1
           (* n (factorial (subl n))))))))

(fact 10)


(define fib
  (Y (lambda (fibo)
       (lambda (n)
         (cond
           [(= n 0) 1]
           [(= n 1) 1]
           [else (+ (fibo (- n 1)) (fibo (- n 2)))])))))

(fib 10)





