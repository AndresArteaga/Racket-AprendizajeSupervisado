#|Andrés Sebastián Arteaga Cabezas
Ejercicio 31 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T2Ejercicio1.rkt")
(include "T3Ejercicio24.rkt")
(include "T3Ejercicio26.rkt")
(include "T3Ejercicio30.rkt")

(define (PCP ejemplos)
  (define (loop H C)
    (if(= 0 C) H
       (let*((nE (true? (map (lambda (x)
                               (equal? (car(reverse x)) (car(reverse(LUUi H (reverse(cdr(reverse x))))))))
                             (cdr ejemplos)))))
         (if nE H
             (loop (PRM H ejemplos) (- C 1))))))
  (loop (nuevo-conceptoUU (car ejemplos) 1) 1000))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(PCP ejemplos)