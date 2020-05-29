#lang racket


(require "tdaindex.rkt")
(require "TDAarchivo.rkt")

(provide commit)
(provide commit?)
(provide getMensaje)
(provide getcommit)


;TDA Commit
;representacion
;(list string string)
;(list "mensaje" "nombre del archivo) 

;CONSTRUCTOR
;descripción: Permite crear un commit
;dom: string X string
;rec: lista
(define commit (lambda (string)
                 (lambda (zona)
                  (if (and (string? string)(list? zona))
        (list string  (car(list-ref(cddr zona )1) ))
      "Commit formato incorrecto"
      ) 
    )))
;PERTENENCIA
;descripción: Función que permite determinar si el constructor commit esta bien implementado
;dom: cualquer cosa
;rec: boolean
(define commit? (lambda (c)
       (and (string? (car c))(string? (cadr c) )
            )
                  ))

;SELECTORES
;descripción: Función que retorna el mensaje del commit
;dom: archivo
;rec: string 
(define getMensaje (lambda(a)
   (if (commit? a)
       (list(car a))
       0
   )
 ))
;descripción: Función que retorna el texto del commit
;dom: archivo
;rec: string 
(define getcommit (lambda(a)
   (if (commit? a)
       (cadr a)
       0
   )
 ))

