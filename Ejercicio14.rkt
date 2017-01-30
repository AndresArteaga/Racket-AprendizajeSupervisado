#|Andrés Sebastián Arteaga Cabezas
Ejercicio 14|#

(#%require racket)
(include "Ejercicio10.rkt")
(include "Ejercicio13.rkt")

(define (stratify n lista)
  (let* ((grupos (cdr (group-by identity (atributo 'clase lista))))
         (pesos (map (lambda (x)
                       (append (list(car x)) (length x)))
                     grupos))
         (cuerpo-pesado (map (lambda (x)
                               (append (list x)
                                       (cdr(assoc(car(reverse x))pesos))))
                             (cdr lista))))
    (folds n (append (list(car lista)) cuerpo-pesado))))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(stratify 3 ejemplos)