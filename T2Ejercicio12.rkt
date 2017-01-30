#|Andrés Sebastián Arteaga Cabezas
Ejercicio 12 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)
(include "T2Ejercicio1.rkt")

(define (especializacion-atributo-numerico conCL indAtri ejemp)
  (let((test (list-ref conCL indAtri))
       (atributo (list-ref ejemp indAtri)))
    (if(equal? '- (car(reverse ejemp)))
       (if(not(match-num test atributo))
          conCL
          (let*((te (NTest test))
                (gen
                 (cond
                   ((equal? te '()) (list te))
                   ((equal? te '(*)) (list (list -inf.0 atributo) (list atributo +inf.0)))
                   (else (list (NTest (list (car te) atributo))
                               (NTest (list atributo (cadr te))))))))
            (map (lambda (x) (list-set conCL indAtri x)) gen)
            ))
       conCL)))

;;Ejecución
;(especializacion-atributo-numerico '((*)(15 35)(20)(si)) 1 '(soleado 25 40 si -))
;(especializacion-atributo-numerico '((*)(*)(20)(si)) 1 '(soleado 25 40 si -))
;(especializacion-atributo-numerico '((*)(*)(20)(si)) 1 '(soleado 25 40 si +))
;(especializacion-atributo-numerico '((*)(10 15)(20)(si)) 1 '(soleado 25 40 si -))