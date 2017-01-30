#|Andrés Sebastián Arteaga Cabezas
Ejercicio 19 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "T2Ejercicio1.rkt")
(include "T7Ejercicio15.rkt");1
(include "T7Ejercicio18.rkt")


(define (DTL arbol-clasico)
  (define (loop ac reglas lhs)
    (cond
      ((equal? '=> (car ac))
       (append reglas (list(list 'match-CL (union-CL (car lhs) (if(= 1 (length lhs))
                                                                  (car lhs)
                                                                  (cadr lhs))) '=> (cadr ac)))))
      ((equal? 'adc (car ac))
       (apply append (map (lambda (x)
                            (loop (car(reverse x)) reglas (append lhs (list(car x)))))
                          (cdr ac))))))
  (loop arbol-clasico '() '()))

(define (DTL-DDT ejemplos) (DTL(DDT ejemplos)))

;;Ejemplos
;;===============================================================
;(DTL '(adc (((soleado)(*)) -> (adc (((*)(-inf 30)) -> (=> +)) 
;                                   (((*)((30) +inf)) -> (=> -))))
;           (((nublado)(*)) -> (=> -))
;           (((lluvioso)(*)) -> (adc (((*)(-inf 10)) -> (=> -))
;                                    (((*)((10) +inf)) -> (=> +))))))