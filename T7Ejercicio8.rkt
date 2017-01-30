#|Andrés Sebastián Arteaga Cabezas
Ejercicio 8 Tema 7: La Formación de Jerarquías de Conceptos |#

(define JC-multivariado '((((soleado) (-inf.0 30)) -> (=> +))
                          (((soleado) ((30) +inf.0)) -> (=> -))
                          (((nublado) (*)) -> (=> -))
                          (((lluvioso) (-inf.0 10)) -> (=> -))
                          (((lluvioso) ((10) +inf.0)) -> (=> -))))