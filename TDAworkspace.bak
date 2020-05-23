#lang racket
;TDA workspace
;representacion
;(list (list string)

;CONSTRUCTOR
;descripción: Función que retorna la lista con los archivos
;dom: lista
;rec: lista de lista
(define workspace (lambda (archivo)
                  (if (list? archivo)
       (list archivo)
      "falso"
      ) 
    ))

;PERTENENCIA
;descripción: Función que permite determinar si el constructor workpace esta bien implementado
;dom: lista
;rec: boolean
(define (workspace? archivo)
  (if (list? archivo)
      #t
      #f
      ))
      
;SELECTORES
;descripción: Función que retorna una lista en la posicion pedida
;dom: lista X entero
;rec: lista
(define (getArchivo lista p)
  (list-ref lista p)
  )      


;Modificadores
;descripción: Función que agrega una lista al workspace
;dom: lista X lista
;rec: lista
(define agregar (lambda (lista)
                  (lambda (archivo)
                    (append (workspace archivo) (list lista)
                    )
                  )))
;-------------------------------------------------------------------------------
