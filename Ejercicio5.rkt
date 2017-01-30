#|Andrés Sebastián Arteaga Cabezas
Ejercicio 5|#

(#%require racket)

(define (codificar lista)
  (let*((frecuencias (map (lambda (x) (cdr x)) lista))
        (total (apply + frecuencias))
        (frecInv (map (lambda (x) (/ x total)) frecuencias))
        (frecAcum (let((a '()))
                    (for-each (lambda (x) (if(empty? a)
                                             (set! a (append a (list x)))
                                             (set! a (append a (list(+ x (car(reverse a))))))))
                              frecInv)
                    a))
        (interv (let((a '()))
                  (for-each (lambda (x) (if(empty? a)
                                           (set! a (list(cons 0 x)))
                                           (set! a (append a (list(cons (cdr(car(reverse a))) x))))))
                            frecAcum)a)))
    (map (lambda (x y) (append (list x) (list y))) interv lista)))

(define (obtener-al-azar0 lista)
  (cond
    ((empty? lista) null)
    ((and (pair? (car lista))
          (number? (cdar lista)))
     (let((codif (codificar lista))
          (rand (random)))
       (caadr(assoc (car(filter (lambda (x) (<= (car x) rand (cdr x)))
                                (map (lambda (x) (car x)) codif)))    
                    codif)))))) 

;;Ejecución de la función desarrollada
;;==================================================================
;(define li '((a . 1)(b . 2)(c . 3)))
;(obtener-al-azar0 li)

;;Comprobación
;;==================================================================
#|(define elementos '())
(do ((x 6000 (- x 1)))
     ((= x 0))
     (set! elementos
           (cons (obtener-al-azar0 '((a . 1)(b . 2)(c . 3))) elementos)))
(define (count a b)
  (define con 0)
  (do((x (length b) (- x 1)))
    ((= x 0) con)
    (if (eq? a (list-ref b (- x 1))) (set! con (+ con 1)) null)))
(map (lambda (x) (cons x (count x elementos))) '(a b c))|#