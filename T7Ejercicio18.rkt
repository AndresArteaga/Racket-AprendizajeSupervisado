#|Andrés Sebastián Arteaga Cabezas
Ejercicio 18 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)

(define (union-CL conCL1 conCL2)
  (map (lambda (x)
         (let*((c (list-ref conCL1 x)))
           (if(equal? c '(*))
              (list-ref conCL2 x)
              c)))
       (range (length conCL1))))


;;Ejemplos
;;===============================================================
;(union-CL '((soleado)(*)) '((*)(10 30)))
;(union-CL '((*)(*)) '((*)(10 30)))