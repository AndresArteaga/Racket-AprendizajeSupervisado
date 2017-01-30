#|Andrés Sebastián Arteaga Cabezas
Ejercicio 20|#

(#%require racket)
(include "list-index.rkt")

(define concepto-inicial '((+ . 0)(- . 0)))

(define (IIA1 desAtributos consInicial ejemp)
  (let* ((indClase (list-index 'clase (map (lambda (x) (car x)) desAtributos)))
         (clasEjem (list-ref ejemp indClase))
         (consActual consInicial)
         ;Funciones
         (actualizar-contabilizacion
          (lambda (ejemplo)
            (set! consActual
                  (map (lambda (x)
                         (if (eq? (car x) clasEjem)
                             ;then
                             (cons (car x) (+ (cdr x) 1))
                             ;else
                             x))
                       consActual
                       )))))
    (actualizar-contabilizacion ejemp)
    consActual
    ))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(IIA1 (car ejemplos) concepto-inicial '(soleado 35 50 fuerte triste hay no +))