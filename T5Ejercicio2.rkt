#|Andrés Sebastián Arteaga Cabezas
Ejercicio 2 Tema 5: La Construcción de Listad de Decisión|#

(#%require racket)
(include "T2Ejercicio1.rkt");match-CL
(include "T3Ejercicio20.rkt");match-TC
(include "T3Ejercicio25.rkt");match-LUU
(include "T4Ejercicio36.rkt");match-IB
(include "T4Ejercicio41.rkt");match-NB
(include "T2Ejercicio18.rkt");HGS
(include "T3Ejercicio28.rkt");HTC
(include "T3Ejercicio31.rkt");PCP
(include "T3Ejercicio32.rkt");LMS
(include "T4Ejercicio34.rkt");IB
(include "T4Ejercicio38.rkt");NB

(define (funcion-match algoritmo)
  (cond
    ((equal? algoritmo HGS) 'match-CL)
    ((equal? algoritmo HTC) 'match-TC)
    ((equal? algoritmo PCP) 'match-LUU)
    ((equal? algoritmo LMS) 'match-LUU)
    ((equal? algoritmo IB) 'match-IB)
    ((equal? algoritmo NB) 'match-NB)))

;;Ejemplos
;;===============================================================
;(funcion-match HGS)
;((eval (funcion-match HGS)) '((soleado)(*)) '(soleado si))
