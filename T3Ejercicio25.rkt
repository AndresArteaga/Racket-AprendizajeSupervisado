#|Andrés Sebastián Arteaga Cabezas
Ejercicio 25 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T3Ejercicio23.rkt")

(define (match-LUU cUU EjSC)
  (let*((traduccion (map
                     (lambda (x y)
                       (traducir x y))
                     (reverse(cdr(reverse(car cUU)))) EjSC))
        (producto (apply + (map
                            (lambda (x y)
                              (* x y))
                            (reverse(cdr(reverse(cadr cUU)))) traduccion))))
    (>= (car(reverse(cadr cUU))) (* -1 producto))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(define meta '((clima (soleado nublado lluvioso)) (temperatura numerico) (humedad numerico) (viento (suave fuerte)) (clase (+ -))))
;(match-LUU (list meta '(0 1 1 0 -30)) '(lluvioso 10 20 suave))
;(match-LUU (list meta '(0 1 1 0 -31)) '(lluvioso 10 20 suave))