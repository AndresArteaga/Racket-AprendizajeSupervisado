#|Andrés Sebastián Arteaga Cabezas
Ejercicio 35 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)
(include "list-index.rkt")
(include "T4Ejercicio34.rkt")

(define (IBi CIB EjSC)
  (let*((dist (map (lambda (x) (distancia x EjSC)) CIB))
        (ind (list-index (car(sort dist <)) dist)))
    (append EjSC (list(car(reverse(list-ref CIB ind)))))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(IBi (cdr ejemplos) '(nublado 6 65 fuerte feliz hay si))
