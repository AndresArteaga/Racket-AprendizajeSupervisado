#|Andrés Sebastián Arteaga Cabezas
Ejercicio 9 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "T2Ejercicio1.rkt")
(include "T3Ejercicio25.rkt")

(define (adg EjSC ramas)
  (or (car(remove*
           '(null)
           (map (lambda (x)
                  (let((conc-eval (cond
                                    ((equal? 'match-LUU (caar x))
                                     (list (with-handlers ((exn:fail? (lambda (v) (caadar x))))
                                             (eval (caadar x)))
                                           (with-handlers ((exn:fail? (lambda (v) (car(cdadar x)))))
                                             (eval (car(cdadar concepto))))))
                                    (else (cadar x)))))
                    (if((eval (caar x)) conc-eval EjSC)
                       (car(reverse x))
                       'null)))
           ramas)))
      '()))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos3.scm"))
;(adg '(soleado 20)
;     '(((match-CL ((soleado) (*))) -> (adg ((match-LUU ((car ejemplos) (1 2 -10))) -> (=> +))
;                                           ((match-LUU ((car ejemplos) (1 2 10))) -> (=> -))))
;       ((match-CL ((nublado) (*))) -> (=> -))))

;(adg '(soleado 20 40 suave triste hay no)
;     '(((match-LUU ((car ejemplos) (1 2 1 2 1 2 1 -10))) -> (=> +))
;       ((match-LUU ((car ejemplos) (1 2 1 2 1 2 1 10))) -> (=> -))))