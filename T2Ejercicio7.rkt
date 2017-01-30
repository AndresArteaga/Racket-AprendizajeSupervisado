#|Andrés Sebastián Arteaga Cabezas
Ejercicio 7 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)
(include "T2Ejercicio6.rkt")

(define (concepto-CL>= concepto1 concepto2)
  (true? (map (lambda (x y) (test-CL>= x y)) concepto1 concepto2)))

;;Ejecución
;;================================================================
;(concepto-CL>= '((lluvioso)(2 10)) '((soleado)(10 20)))
;(concepto-CL>= '((lluvioso)(2 35)) '((soleado)(23)))
;(concepto-CL>= '((lluvioso)(23)) '((soleado)(2 35)))