#|Andrés Sebastián Arteaga Cabezas
Ejercicio 14 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)
(include "T2Ejercicio1.rkt")
(include "T2Ejercicio9.rkt")
(include "T2Ejercicio12.rkt")

(define (especializaciones-CL conCL metaD ej)
  (define (especializar conCL metaD ej ind)
    (if(equal? 'numerico (cadr(list-ref metaD ind)))
       (especializacion-atributo-numerico conCL ind ej)
       (especializaciones-atributo-nominal conCL ind metaD)))
  (if(or (equal? '+ (car(reverse ej)))
         (not(match-CL conCL (reverse(cdr(reverse ej))))))
     (list conCL)
     (append-map (lambda (x)
            (especializar conCL metaD ej x))
          (range (- (length metaD) 1)))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(especializaciones-CL '((*)(5 30)(*)(*)(*)(*)(*)) (car ejemplos) '(soleado 10 20 fuerte feliz hay si -))