#|Andrés Sebastián Arteaga Cabezas
Ejercicio 20 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "Ejercicio8.rkt")
(include "Ejercicio24.rkt");cross-validation
(include "T5Ejercicio1.rkt");LDi
(include "T7Ejercicio10.rkt");JCi
(include "T7Ejercicio19.rkt");DDT DTL-DDT

(define agaricus (leer-ejemplos "agaricus-lepiota.scm"))
(define lymphography (leer-ejemplos "lymphography.scm"))

(cross-validation DDT JCi lymphography 10)
(cross-validation DDT JCi agaricus 10)

(cross-validation DTL-DDT LDi lymphography 10)
(cross-validation DTL-DDT LDi agaricus 10)