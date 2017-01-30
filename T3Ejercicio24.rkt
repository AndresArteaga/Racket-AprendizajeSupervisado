#|Andrés Sebastián Arteaga Cabezas
Ejercicio 24 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)

(define (nuevo-conceptoUU metaD init)
  (append (list metaD) (list(map (lambda (x) (* init(- (* 2 (random)) 1))) metaD))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(nuevo-conceptoUU (car ejemplos) 1)