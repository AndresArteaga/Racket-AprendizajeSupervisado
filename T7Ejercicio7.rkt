#|Andrés Sebastián Arteaga Cabezas
Ejercicio 7 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "T2Ejercicio1.rkt")

(define (adc EjSC ramas)
  (let((a (remove* '(null)
                   (map (lambda (x)
                          (if(match-CL (car x) EjSC)
                             (car(reverse x))
                             'null))
                        ramas))))
    (or (if(empty? a) #f
                (car a))
      '())))

;;Ejecución
;;===============================================================
;(adc '(soleado 20)
;     '((((soleado) (*)) -> (adc (((*) (-inf.0 30)) -> (=> +))
;                                (((*) ((30) +inf.0)) -> (=> -))))
;       (((nublado) (*)) -> (=> -))
;       (((lluvioso) (*)) -> (adc (((*) (-inf.0 10)) -> (=> -))
;                                 (((*) ((10) +inf.0)) -> (=> +))))))

;(adc '(soleado 20)
;     '((((*) (-inf.0 30)) -> (=> +))
;       (((*) ((30) +inf.0)) -> (=> -))))