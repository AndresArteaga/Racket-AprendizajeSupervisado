#|Andrés Sebastián Arteaga Cabezas
Ejercicio 26 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T3Ejercicio25.rkt")

(define (LUUi cUU EjSC)
  (append EjSC (if(match-LUU cUU EjSC)
                  (list '+)
                  (list '-))))
;;Ejecución
;;===============================================================
;(define meta '((clima (soleado nublado lluvioso)) (temperatura numerico) (humedad numerico) (viento (suave fuerte)) (clase (+ -))))
;(LUUi (list meta '(0 1 1 0 -30)) '(soleado 30 40 suave))
;(LUUi (list meta '(0 1 1 0 -31)) '(soleado 10 20 suave))