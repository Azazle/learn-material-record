#lang slideshow
;provide for outside require
(provide rainbow square)

(define c (circle 10))
(define r (rectangle 10 20))
(define (square n)
  (filled-rectangle n n))

(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

(define (checkerboard p)
  (let* ([rp (colorize p "red")]
         [bp (colorize p "black")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))


(define (series mk)
  (hc-append 4 (mk 5) (mk 10) (mk 20)))
;(series (λ(size) (checkerboard (square size))))

#|
(define (series-square interval)
  (let ([f (λ(n) (checkerboard (square n)))])
    (hc-append interval (f 5) (f 10) (f 20))))
|#

#|
(define (series-square interval)
  (define f (λ(n) (checkerboard (square n))))
    (hc-append interval (f 5) (f 10) (f 20)))
|#

#|
(define (series-square-mk interval)
  (λ(f) (hc-append interval (f 5) (f 10) (f 20))))
;((series-square 10) (λ(n) (checkerboard (square n))))

(define (series-square-op interval)
  ((series-square-mk interval) (λ(n) (checkerboard (square n)))))
;(series-square-op 10)
;(series-square-op 20)
|#

(define (rgb-series mk)
  (vc-append
   (series (λ(sz) (colorize (mk sz) "red")))
   (series (λ(sz) (colorize (mk sz) "green")))
   (series (λ(sz) (colorize (mk sz) "blue")))))
;(rgb-series circle)
;(rgb-series square)

(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue"))))
;(series (rgb-maker square))
;(series (rgb-maker circle))


(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple")))
;(rainbow (square 5))
;(apply vc-append (rainbow (square 5)))

;(require pict/flash)
;(filled-flash 40 30)
