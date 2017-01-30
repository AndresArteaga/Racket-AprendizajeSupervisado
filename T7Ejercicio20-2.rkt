#|Andrés Sebastián Arteaga Cabezas
Ejercicio 20 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "Ejercicio8.rkt")
(include "Ejercicio24.rkt");cross-validation
(include "T5Ejercicio1.rkt");LDi
(include "T7Ejercicio10.rkt");JCi
(include "T7Ejercicio20.rkt");DDT DTL-DDT

(define agaricus (leer-ejemplos "agaricus-lepiota.scm"))
(define lymphography (leer-ejemplos "lymphography.scm"))

(cross-validation DDT2 JCi lymphography 10)
(cross-validation DDT2 JCi agaricus 10)

(cross-validation DTL-DDT2 LDi lymphography 10)
(cross-validation DTL-DD2 LDi agaricus 10)