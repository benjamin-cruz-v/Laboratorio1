#lang racket


(provide commit)
(provide commit?)
(provide getMensaje)
(provide getcommit)

;Funciones que se exportan
;TDA Archivos
;representacion
;(list string string)
;(list "archivo1" "texto1") 

;CONSTRUCTOR
;descripción: Permite crear un archivo
;dom: string X string
;rec: lista
(define commit (lambda (string)
                 (lambda (zona)
                  (if (and (string? string)(list? zona))
        (list string (car zona))
      "Commit formato incorrecto"
      ) 
    )))
;PERTENENCIA
;descripción: Función que permite determinar si el constructor archivo esta bien implementado
;dom: cualquer cosa
;rec: boolean
(define commit? (lambda (c)
         (and (cons? c)
              (not (null? ((commit (car c)) (cdr c))))
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









