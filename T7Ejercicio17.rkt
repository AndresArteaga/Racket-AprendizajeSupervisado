#|Andrés Sebastián Arteaga Cabezas
Ejercicio 17 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "T7Ejercicio12.rkt")
(include "T7Ejercicio16.rkt")

(define (mayor-discriminante2 discs ejemplos)
  (let*((a '())
        (b (map (lambda (x)
           (and (set! a (append a (list(capacidad-de-discriminacion2 x ejemplos))))
                (append (list x) (list(car(reverse a))))))
         discs)))
    (remove* '(null)
             (remove-duplicates
              (apply append
                     (map (lambda (x)
                            (map (lambda (y)
                                   (if(equal? (cadr y) x)
                                      (car y)
                                      'null))
                                 b))
                          (sort a >)))))))

(define (divd->adc disc metaD division)
  (let*((nDesc (if(equal? 'numerico (cadr(reverse disc)))
                  (let*((s-v (car division)))
                    (if(equal? '>= (car s-v))
                       (list (cdr s-v) +inf.0)
                       (list -inf.0 (cdr s-v))))
                  (list (car division)))))
    (append (build-list (cadr disc) (lambda (x) '(*))) (list nDesc) (build-list (- (length metaD) (cadr disc) 2) (lambda (x) '(*))))))

(define (DDT0 discs ejemplos)
  (if(empty? (cdr ejemplos))
     (list '=> 'DESCONOCIDO)
     (if(or (empty? discs)
            (= 1 (length(remove-duplicates(map (lambda (x)
                                                 (car(reverse x)))
                                               (cdr ejemplos))))))
        (list '=> (car(reverse(cadr ejemplos))))
        (append '(adc) (let*((discOrd (mayor-discriminante2 discs ejemplos))
                             (disc> (car discOrd))
                             (discs< (cdr discOrd))
                             (divisiones (dividir-ejemplos disc> (cdr ejemplos))))
                         (map (lambda (x)
                                (list (divd->adc disc> (car ejemplos) x)
                                      '->
                                      (DDT0 discs< (cons (car ejemplos) (cdr x)))))
                              divisiones))))))

(define (DDT2 ejemplos)
  (DDT0 (reverse(cdr(reverse(generar-discriminantes (car ejemplos) (cdr ejemplos))))) ejemplos))

;;Ejecucion
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos3.scm"))
;(DDT ejemplos)

;(DDT0 '((perspectiva 0 (soleado lluvioso nublado))
;        (temperatura 1 numerico 10)
;        (temperatura 1 numerico 25)
;        (temperatura 1 numerico 30))
;      '(((perspectiva (soleado lluvioso nublado))
;         (temperatura numerico)
;         (clase (+ -)))
;        (soleado 10 +) (lluvioso 25 -) (nublado 30 +)))