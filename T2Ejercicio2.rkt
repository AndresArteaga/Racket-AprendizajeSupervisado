#|Andrés Sebastián Arteaga Cabezas
Ejercicio 2 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)
(include "T2Ejercicio1.rkt")

(define (CLi concepto ej-sin-clase)
  (append ej-sin-clase (if (match-CL concepto ej-sin-clase)
                           (list '+)
                           (list '-))))

;;Ejecución
;;===============================================================
;(CLi '((soleado)(*)(10 40)(si)) '(soleado 30 25 si))
;(CLi '((soleado)(*)(10 40)(si)) '(lluvioso 30 25 si))