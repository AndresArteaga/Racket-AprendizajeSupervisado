#|Andrés Sebastián Arteaga Cabezas
Ejercicio 21 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T3Ejercicio20.rkt")

(define (TCi CTC EjSC)
  (append EjSC (if(match-TC CTC EjSC)
                  (list '+)
                  (list '-))))

;;Ejecución
;(TCi '(4 (soleado)(*)(10 40)(si)) '(soleado 30 40 si))
;(TCi '(3 (soleado)(*)(10 40)(si)) '(soleado 30 40 si))
;(TCi '(2 (soleado)(*)(10 (40))(si)) '(soleado 30 40 si))
;(TCi '(4 (soleado)(*)(10 40)(si)) '(soleado 30 25 no))
;(TCi '(3 (soleado)(*)(10 40)(si)) '(30 soleado 25 no))