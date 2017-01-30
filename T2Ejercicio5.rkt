#|Andrés Sebastián Arteaga Cabezas
Ejercicio 5 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)

(define(concepto-CL-mas-especifico metadatos)
  (if(not(= 1 (length metadatos)))
     (append '(()) (concepto-CL-mas-especifico (cdr metadatos)))
     null))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(concepto-CL-mas-especifico (car ejemplos))