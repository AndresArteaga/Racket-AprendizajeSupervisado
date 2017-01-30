#|Andrés Sebastián Arteaga Cabezas
Ejercicio 11 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)

(define (dividir-ejemplos disc EjSM)
  (if(= 3 (length disc))
     (let*((pos (cadr disc))
           (vals (car(reverse disc)))
           (grupos (group-by (lambda (x) (list-ref x pos)) EjSM)))
       (map (lambda (x) (append (list(list-ref (car x) pos)) x)) grupos))
     (let*((pos (cadr disc))
           (umb (car(reverse disc)))
           (ge (list(list '>= umb)))
           (lt (list(list '< umb)))
           (grupos (group-by
                    (lambda (x)
                      (if(< (list-ref x pos) umb) lt ge))
                    EjSM))) 
       (map (lambda (x) (append (if(< (list-ref (car x) pos) umb)
                                   lt
                                   ge) x)) grupos))))

;;Ejemplos
;;===============================================================
;(dividir-ejemplos '(clima 0 (soleado lluvioso))
;                  '((soleado 10 -)(soleado 25 +)(lluvioso 30 -)))
;(dividir-ejemplos '(temperatura 1 numerico 25)
;                  '((soleado 10 -) (soleado 25 +) (lluvioso 30 -)))