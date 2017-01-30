#|Andrés Sebastián Arteaga Cabezas
Ejercico 15|#

(#%require (only racket include))
(include "list-index.rkt")
(include "find.rkt")

(define (AO ejemplos)
  (let*
      (;;Asignación de variables locales.
       ;;================================
       (atributos (car ejemplos))
       (casos (cdr ejemplos))
       (indice-clase ;el índice de 'clase en la lista de atributos.
        (list-index 'clase (map car atributos)))
       (clases-posibles
        (cdr (list-ref atributos indice-clase)))
       ;;variable que mantiene la cuenta de las apariciones de cada clase.
       (clases-contabilizadas
        ;;Como primer paso se inicializa a 0 la cuenta de cada clase.
        (map (lambda (clase) (cons clase 0)) (car clases-posibles)))
       (concepto '());variable sin asignación, de momento
       ;;Asignación de Funciones locales
       ;;===============================
       ;;función que admite como parámetros un ejemplo, el cual utiliza
       ;;para actualizar la contabilización de clases.
       (actualizar-contabilizacion
        (lambda (ejemplo)
          (let((clase-del-ejemplo (list-ref ejemplo indice-clase)))
            (set! clases-contabilizadas
                  (map (lambda (x)
                         (if (eq? (car x) clase-del-ejemplo)
                             ;then
                             (cons (car x) (+ (cdr x) 1))
                             ;else
                             x))
                       clases-contabilizadas
                       )))))
       );fin de las asignaciones let*
    ;;Ahora, por cada ejemplo de entrenamiento,
    ;;se actualiza la contabilización de clases.
    (for-each actualizar-contabilizacion casos)
    ;;Finalmente se escoge la clase que más veces ha aparecido:
    ;;primero, se obtiene el número máximo;
    (set! concepto (apply max (map cdr clases-contabilizadas)))
    ;;segundo se obtiene la clase con ese número máximo
    ;;almacenado temporalmente en la variable concepto
    (set! concepto
          (car (list-ref clases-contabilizadas
                         (list-index concepto (map (lambda (x)
                                                     (find concepto x))
                                                   clases-contabilizadas)))))
          ;(car (find (lambda (x) (= (cdr x) concepto)) clases-contabilizadas)))
    ;;Y por último se devuelve el concepto inducido por el algoritmo
    concepto
    ))

(define (AOi concepto ejemplo-sin-clase)
  (append ejemplo-sin-clase (list concepto)))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(define esencia (AO ejemplos))
;(define ejemplos-sin-clase (map (lambda (x) (reverse(cdr(reverse x)))) ejemplos))
;(define extension (map (lambda (x) (AOi esencia x)) ejemplos-sin-clase))