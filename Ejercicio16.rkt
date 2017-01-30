#|Andrés Sebastián Arteaga Cabezas
Ejercicio 16|#

(define (calcPE original aprendido)
  (let ((nCasos (length (cdr original)))
        (aciertos 0)
        (errores 0))
    (map (lambda (x y)
           (if (equal? x y)
               (set! aciertos (+ aciertos 1))
               (set! errores (+ errores 1))))
         (cdr original) (cdr aprendido))
    (list (real->double-flonum(* 100 (/ aciertos nCasos))) (real->double-flonum(* 100 (/ errores nCasos))))))

(define (calcPE1 original aprendido)
  (let ((nCasos (length original))
        (aciertos 0))
    (map (lambda (x y)
           (if (equal? x y)
               (set! aciertos (+ aciertos 1))
               'null))
         original aprendido)
    (list (list aciertos nCasos))))