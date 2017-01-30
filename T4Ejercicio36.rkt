#|Andrés Sebastián Arteaga Cabezas
Ejercicio 36 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)
(include "T4Ejercicio35.rkt")

(define (match-IB CIB ejemplo)
  (equal? (IBi CIB (reverse(cdr(reverse ejemplo)))) ejemplo))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(match-IB (cdr ejemplos) (cadr ejemplos))
;(match-IB (cdr ejemplos) '(nublado 6 65 fuerte feliz hay si +))
