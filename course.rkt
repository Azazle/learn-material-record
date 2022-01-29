(define (pair A B)
  (λ (sel)
    (sel A B)))
(define (fst A B) A)
(define (snd A B) B)
;((pair 1 2) fst)
;((pair 1 2) snd)

(define (cnd C T E)
  (C T E))
(define (truth A B) A)
(define (falsity A B) B)
;(cnd truth 1 2)
;(cnd falsity 1 2)


(define (fact n)
  (if (zero? n)
      1
      (* n (fact (subl n)))))
;(fact 10)

(define (subl x) (- x 1))
(define (addl x) (+ x 1))
(define Z (λ (f) (λ (x) x)))

(define (suc N)
  (λ (f)
    (λ (x)
      (f ((N f) x)))))
      ;((N f) f) x)))

(define (n->i N) ((N addl) 0))
(define (i->n i) (if (zero? i) Z (suc (i->n (subl i)))))
;(n->i (i->n 10))

; M + N = 1 + 1 + ... + 1 + N
(define ((add M) N)
  ((M suc) N))
;(n->i ((add (i->n 5)) (i->n 4)))

; M * N = M + M + ... + M + 0
(define ((mult M) N)
  ((M (add N)) Z))
;(n->i ((mult (i->n 5)) (i->n 4)))

(define (Z? N)
  ((N (λ (_) falsity)) truth))


#|
  < 0, 0 > 0  copy snd, succ snd
  < 0, 1 > 1
  < 1, 2 > 2
  < 2, 3 > 3
  < 3, 4 > 4
|#

(define (pred N)
  (((N (lambda (p)
         (pair (p snd)
               (suc (p snd)))))
  (pair Z Z))
   fst))

;(n->i (pred (i->n 5)))
;(n->i (pred (i->n 10)))







