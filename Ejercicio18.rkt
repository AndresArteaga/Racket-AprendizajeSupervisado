#|Andrés Sebastián Arteaga Cabezas
Ejercicio 18|#
(#%require racket)
(include "list-index.rkt")
(include "Ejercicio6.rkt")

(define (A1 ejemplos)
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
       ;(concepto '());variable sin asignación, de momento
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
    ;;Finalemente se retorna las clases contabilizadas
    clases-contabilizadas))

(define (A1i concepto ejemplo-sin-clase)
  (append ejemplo-sin-clase (list (obtener-al-azar concepto))))


;;Ejecución
;;=========================================================
(include "Ejercicio8.rkt")
(include "Ejercicio16.rkt")

(define ejemplos2 (leer-ejemplos "ejemplos2.scm"))
(define ejemplos (leer-ejemplos "ejemplos.scm"))
(define escencia (A1 ejemplos2))
(define ejemplos-sin-clase2-A1A1i (map (lambda (x) (reverse(cdr(reverse x)))) ejemplos2))
(define extension2-A1A1i (map (lambda (x) (A1i escencia x)) ejemplos-sin-clase2-A1A1i))
(define precision-error-A1A1i (calcPE ejemplos2 extension2-A1A1i))

;precision-error-A1A1i
;ejemplos-sin-clase2-A1A1i
;extension2-A1A1i
;ejemplos2