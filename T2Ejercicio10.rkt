#|Andrés Sebastián Arteaga Cabezas
Ejercicio 10 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)

(define (generalizacion-atributo-nominal conCL indAtri metaD)
  (let((test (list-ref conCL indAtri))
       (valores (cadr(list-ref metaD indAtri))))
    (if(equal? test '())
       (if(list? valores)
          (map (lambda (x) (list-set conCL indAtri (list x))) valores)
          null)
       (list(list-set conCL indAtri '(*))))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(generalizacion-atributo-nominal '((soleado)(*)(20)(si)) 3 (car ejemplos))