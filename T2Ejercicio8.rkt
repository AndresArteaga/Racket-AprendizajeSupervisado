#|Andrés Sebastián Arteaga Cabezas
Ejercicio 8 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require (only racket include))
(include "T2Ejercicio7.rkt")

(define (cmp-concepto-CL con1 con2)
  (cond
    ((and (concepto-CL>= con1 con2)
          (not(concepto-CL>= con2 con1))) 1)
    ((and (not(concepto-CL>= con1 con2))
          (concepto-CL>= con2 con1)) -1)
    (else 0)))

;;Ejecución
;;=============================================================
;(cmp-concepto-CL '((lluvioso)(2 35)) '((soleado)(23)))
;(cmp-concepto-CL '((lluvioso)(10 20)) '((soleado)(10 20)))
;(cmp-concepto-CL '((soleado)(23)) '((lluvioso)(2 35)))
;(cmp-concepto-CL '((*) (6 +inf.0) (-inf.0 79) (*) (feliz) (hay) (*)) '((*) (27 +inf.0) (-inf.0 75) (*) (*) (*) (si)))