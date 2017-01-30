#|Andrés Sebastián Arteaga Cabezas
Ejercicio 34 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)

(define (IB ejemplos) ejemplos)

(define (distancia ejemplo-x ejemplo-y)
  (let*((lm (if(> (length ejemplo-x) (length ejemplo-y))
               (length ejemplo-y)
               (length ejemplo-x)))
        (pAtri (map (lambda (x y) (list x y))
                    (take ejemplo-x lm) (take ejemplo-y lm)))
        (dif (lambda (x)
               (expt (cond
                       ((number? (car x)) (- (car x) (cadr x)))
                       ((equal? (car x) (cadr x)) 0)
                       (else 1)) 2))))
    (let*((s 0))
      (for-each (lambda (x) (set! s (+ s x)))
                (map dif pAtri))
      (sqrt s))))

;;Ejecución
;;=========================================================
;(distancia '(soleado 10 20 si +) '(soleado 10 20 si))
;(distancia '(soleado 11 30 si +) '(soleado 10 20 si))
;(distancia '(nublado 10 25 no +) '(soleado 10 20 si))