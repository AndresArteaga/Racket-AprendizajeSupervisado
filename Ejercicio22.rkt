#|Andrés Sebastián Arteaga Cabezas
Ejercicio 22|#

(#%require racket)
(include "Ejercicio16.rkt")

(define (resustitucion entre inter ejem)
  (let* ((ejem-sin-clase (map (lambda (x) (reverse(cdr(reverse x)))) ejem))
         (extension (map (lambda (x) (inter (entre ejem) x)) ejem-sin-clase)))
    (calcPE ejem extension)))

(define (leave-one-out entre inter ejemp)
  (let* (;Variables locales
         (extension '())
         (extensionAcumulada (list))
         (nuevoEjemplo ejemp)
         (ejemplo-sin-clase '())
         (nEntrenamiento (append (list (car ejemp))(cddr ejemp)))
         (ejemplo-prueba (append (list (car ejemp))(list(cadr ejemp))))
         ;Funciones Locales
         (mover
          (lambda (ejemplo)
            (let((eje ejemplo))
              (set! nuevoEjemplo (append (list (car eje)) (append (cddr eje) (list (cadr eje)))))
              (set! nEntrenamiento (append (list (car nuevoEjemplo))(cddr nuevoEjemplo)))
              (set! ejemplo-prueba (append (list (car nuevoEjemplo))(list(cadr nuevoEjemplo))))))))
    (do ((x 0 (+ x 1)))
      ((= x (length (cdr ejemp))) extensionAcumulada)
      (set! ejemplo-sin-clase (map (lambda (x) (reverse(cdr(reverse x)))) ejemplo-prueba))
      (set! extension (map (lambda (x) (inter (entre nEntrenamiento) x)) ejemplo-sin-clase))
      (set! extensionAcumulada (append extensionAcumulada (cdr extension)))
      (mover nuevoEjemplo))
    (calcPE ejemp (append (list(car ejemp)) extensionAcumulada))))

;;Ejecución:
;;===========================================================
;(include "Ejercicio8.rkt")
;(include "Ejercicio15.rkt")
;(include "Ejercicio18.rkt")
;(include "Ejercicio21.rkt")

;(define 25Ejemplos (leer-ejemplos "ejemplos3.scm"))

;(resustitucion AO AOi 25Ejemplos)
;(resustitucion A1 A1i 25Ejemplos)
;(resustitucion IA1 A1i 25Ejemplos)
;(display "\n")
;(display "\n")
;(leave-one-out AO AOi 25Ejemplos)
;(leave-one-out A1 A1i 25Ejemplos)
;(leave-one-out IA1 A1i 25Ejemplos)
