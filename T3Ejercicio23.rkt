#|Andrés Sebastián Arteaga Cabezas
Ejercicio 23 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "list-index.rkt")

(define (traducir meta-A val)
  (if(equal? (cadr meta-A) 'numerico)
     val
     (list-index val (cadr meta-A))))

;;Ejecución
;(traducir '(clima (soleado nublado lluvioso)) 'lluvioso)
;(traducir '(temperatura numerico) 15)