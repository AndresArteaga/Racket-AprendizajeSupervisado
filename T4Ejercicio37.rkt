#|Andrés Sebastián Arteaga Cabezas
Ejercicio 37 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)

(define (nuevo-conceptoNB metaD)
  (define (loop atributo temp)
    (if(null? atributo)
       (list (append (list '+) temp) (append (list '-) temp))
       (if(equal? 'numerico (cadar atributo))
          (loop (cdr atributo) (append temp (list(list 'numerico 0 0))))
          (loop (cdr atributo) (append temp (list (map (lambda (x) (list x 0)) (cadar atributo))))))))
  (loop (reverse(cdr(reverse metaD))) '(0)))

(define (INB CNB ejemplo)
  (let*((clase (car(reverse ejemplo)))
        (NBactualizar (assoc clase CNB))
        (NBrestante (remove NBactualizar CNB))
        (pares (map (lambda (x y) (list x y))
                    (cddr NBactualizar)
                    (reverse(cdr(reverse ejemplo)))))
        (actualizar (lambda (x)
                      (if(equal? 'numerico (caar x))
                         (list (list-ref (car x) 0)
                               (+ (list-ref (car x) 1) (cadr x))
                               (+ (list-ref (car x) 2) (expt (cadr x) 2)))
                         (map (lambda (c)
                                (list (car c)
                                      (if(equal? (car c) (cadr x))
                                         (+ 1 (cadr c))
                                         (cadr c))))
                              (car x))))))
    (if(equal? '+ clase)
       (append (list(append (list(car NBactualizar)) (list(+ 1 (cadr NBactualizar))) (map actualizar pares))) NBrestante)
       (append NBrestante (list(append (list(car NBactualizar)) (list(+ 1 (cadr NBactualizar))) (map actualizar pares)))))))

;;Ejecución
;;=========================================================
;(define meta '((clima (soleado nublado lluvioso))(temperatura numerico)(humedad numerico)(viento (suave fuerte))(animo (feliz triste))(estres (hay nohay))(dinero (si no))(clase (+ -))))
;(nuevo-conceptoNB meta)
;(INB (nuevo-conceptoNB meta) '(soleado 30 40 fuerte feliz hay si -))


