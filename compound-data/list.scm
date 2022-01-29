;list operations

;1. reference
(define (m-list-ref items n)
  (if (= n 0)
      (car items)
      (m-list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))
(m-list-ref squares 3)
;(list-ref squares 3)

;2. length
;recursive style
(define (m-length items)
  (if (null? items)
      0
      (+ 1 (m-length (cdr items)))))
(define odds (list 1 3 5 7))
(m-length odds)

;iterative style
(define (n-length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ count 1))))
  (length-iter items 0))
(n-length odds)

;3. append
;(append squares odds)
;(append odds squares)


;4. mapping over lists
(define (scale-list items factor)
  (if (null? items)
      (list )  ;nil
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))
(scale-list (list 1 2 3 4 5) 10)


(define (mmap proc items)
  (if (null? items)
      (list )  ;nil
      (cons (proc (car items))
            (mmap proc (cdr items)))))
;(mmap abs (list -10 2.5 -11.6 17))
;(define square (lambda (x) (* x x)))
;(mmap square (list 1 2 3 4))
(mmap (lambda (x) (* x x)) (list 1 2 3 4))

(define (m-scale-list items factor)
  (mmap (lambda (x) (* x factor)) items))
(m-scale-list (list 1 2 3 4 5) 10)

;standard map more general
(map + (list 1 2 3) (list 40 50 60) (list 700 800 900))
(map (lambda (x y) (+ x (* 2 y)))
     (list 1 2 3) (list 4 5 6))

