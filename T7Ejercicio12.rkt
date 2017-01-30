#|Andrés Sebastián Arteaga Cabezas
Ejercicio 11 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)

(define (generar-discriminantes metaD ejemplos)
  (apply append
         (map
          (lambda (x)
            (let*((n-v (list-ref metaD x)))
              (if(equal? 'numerico (cadr n-v))
                 (map (lambda (c)(list (car n-v) x 'numerico c))
                      (sort (remove-duplicates (map
                                                (lambda (y)
                                                  (list-ref y x))
                                                ejemplos)) <))
                 (list(list (car n-v) x (cadr n-v))))))
          (range (length metaD)))))

;;Ejemplos
;;===============================================================
;(generar-discriminantes
; '((perspectiva (soleado lluvioso))
;   (temperatura numerico))
; '((soleado 10 -)(soleado 25 +)(lluvioso 30 -)))