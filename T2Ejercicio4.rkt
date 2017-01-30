#|Andrés Sebastián Arteaga Cabezas
Ejercicio 4 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)

(define(concepto-CL-mas-general metadatos)
  (if(not(= 1 (length metadatos)))
     (append '((*)) (concepto-CL-mas-general (cdr metadatos)))
     null))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(concepto-CL-mas-general (car ejemplos))