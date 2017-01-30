#|Andrés Sebastián Arteaga Cabezas
Ejercicio 24|#

(#%require racket)
(include "Ejercicio11.rkt");mezclar
(include "Ejercicio13.rkt");folds
(include "Ejercicio14.rkt");stratify
(include "Ejercicio16.rkt");CalcPE

(define (ejEnt x)
  (if (= (length x) 1) x
      (if (= (length x) 2)
          (mezclar (car x) (cdr x))
          (mezclar (car x) (ejEnt (cdr x))))))

(define (cross-validation entre inter ejem nFold)
  (let*(;Variables locales
        (ac 0)
        (to 0)
        (cFolds (folds nFold ejem))
        (entrenamiento (ejEnt (cdr cFolds)))
        (prueba1 '())
        (prueba (car cFolds))
        (ejemplo-sin-clase '())
        (extension '())
        ;Funciones locales
        (mover
          (lambda (ejemplo)
            (let((eje ejemplo))
              (set! cFolds (append (cdr eje) (list(car eje))))
              (set! entrenamiento (ejEnt (cdr cFolds)))
              (set! prueba (car cFolds))))))
    ;entrenamiento
    (do ((x 0 (+ x 1)))
      ((= x nFold) prueba1)
      (set! ejemplo-sin-clase (map (lambda (x) (reverse(cdr(reverse x)))) (cdr prueba)))
      (set! extension (map (lambda (x) (inter (entre entrenamiento) x)) ejemplo-sin-clase))
      (set! prueba1 (append prueba1 (calcPE1 (cdr prueba) extension)))
      (mover cFolds))
    (for-each (lambda(x)(and(set! ac (+ ac (car x)))
                            (set! to (+ to (cadr x)))))prueba1)
    (exact->inexact(* 100 (/ ac to)))))

(define (stratified-cross-validation entre inter ejem nFold)
  (let*(;Variables locales
        (ac 0)
        (to 0)
        (cFolds (stratify nFold ejem))
        (entrenamiento (ejEnt (cdr cFolds)))
        (prueba1 '())
        (prueba (car cFolds))
        (ejemplo-sin-clase '())
        (extension '())
        ;Funciones locales
        (mover
          (lambda (ejemplo)
            (let((eje ejemplo))
              (set! cFolds (append (cdr eje) (list(car eje))))
              (set! entrenamiento (ejEnt (cdr cFolds)))
              (set! prueba (car cFolds))))))
    ;entrenamiento
    (do ((x 0 (+ x 1)))
      ((= x nFold) prueba1)
      (set! ejemplo-sin-clase (map (lambda (x) (reverse(cdr(reverse x)))) (cdr prueba)))
      (set! extension (map (lambda (x) (inter (entre entrenamiento) x)) ejemplo-sin-clase))
      (set! prueba1 (append prueba1 (calcPE1 (cdr prueba) extension)))
      (mover cFolds))
    (for-each (lambda(x)(and(set! ac (+ ac (car x)))
                            (set! to (+ to (cadr x)))))prueba1)
    (exact->inexact(* 100 (/ ac to)))))

;;Ejecución
;;===================================================
(include "Ejercicio8.rkt")
(include "Ejercicio15.rkt")
(include "Ejercicio18.rkt")
(include "Ejercicio21.rkt")
(define 25Ejemplos (leer-ejemplos "ejemplos3.scm"))
(cross-validation AO AOi 25Ejemplos 10)
(cross-validation A1 A1i 25Ejemplos 10)
(cross-validation IA1 A1i 25Ejemplos 10)
;(stratified-cross-validation AO AOi 25Ejemplos 10)
;(stratified-cross-validation A1 A1i 25Ejemplos 10)
;(stratified-cross-validation IA1 A1i 25Ejemplos 10)
;;===================================================