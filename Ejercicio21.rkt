#|Andrés Sebastián Arteaga Cabezas
Ejercicio 21|#

(#%require (only racket include))
(include "Ejercicio20.rkt")

(define (IA1 ejemp)
  (let* ((atributos (car ejemp))
         (casos (cdr ejemp))
         (concepto '((+ . 0)(- . 0))))
    (for-each (lambda (x)(set! concepto (IIA1 atributos concepto x))) casos)    
    concepto))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(IA1 ejemplos)