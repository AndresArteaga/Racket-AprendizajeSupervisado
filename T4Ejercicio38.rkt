#|Andrés Sebastián Arteaga Cabezas
Ejercicio 38 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)
(include "T4Ejercicio37.rkt")

(define (NB ejemplos)
  (define (loop CNB ejemplosR)
    (if(null? ejemplosR) CNB
       (loop (INB CNB (car ejemplosR)) (cdr ejemplosR))))
  (loop (nuevo-conceptoNB (car ejemplos)) (cdr ejemplos)))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(NB ejemplos)