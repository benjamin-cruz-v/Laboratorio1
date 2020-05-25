#lang racket

(provide index)
(provide index?)
(provide agregarIndex)

;TDA index
;representacion
;(list string)

;CONSTRUCTOR
;descripción: Función que retorna la lista con los archivos subidos al index
;dom: lista
;rec: lista de lista

(define index (lambda (l)
                 (if (list? l)
                      l
                     "falso"
                )))

;PERTENENCIA
;descripción: Función que permite determinar si el constructor index esta bien implementado
;dom: lista
;rec: boolean
(define (index? lista)
  (if (list? lista)
      #t
      #f
      ))

;Modificadores
;descripción: Función que agrega una lista al index
;dom: lista X lista
;rec: lista
(define agregarIndex (lambda (lista)
                  (lambda (archivo)
                    (append (index archivo) (list lista)
                    )
                  )))

;Ejemplo de uso
;(index  (((git add) (list "nombre1"))zona1))