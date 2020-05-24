#lang racket
(require "TDAarchivo.rkt")
;Funciones que se exportan
(provide workspace)
(provide workspace?)
(provide getArchivo)
(provide agregarA)



;TDA workspace
;representacion
;(list (list string)

;CONSTRUCTOR
;descripción: Función que retorna la lista con los archivos
;dom: lista
;rec: lista de lista
(define (workspace . archivo)archivo)

;PERTENENCIA
;descripción: Función que permite determinar si el constructor workpace esta bien implementado
;dom: lista
;rec: boolean
(define workspace? (lambda (archivo)
  (if (list? archivo)
      #t
      #f
      )))
      
;SELECTORES
;descripción: Función que retorna una lista en la posicion pedida
;dom: lista X entero
;rec: lista
(define getArchivo (lambda (lista p)    
               (if (= p 0)
                   (car lista) 
                   (getArchivo (cdr lista) (- p 1))  
               )
              ))

;Modificadores
;descripción: Función que agrega una lista al workspace
;dom: lista X lista
;rec: lista
(define agregarA (lambda (lista)
                  (lambda (archivo)
                    (append (workspace archivo) (list lista)
                    )
                  )))
;-------------------------------------------------------------------------------

;Ejemplo de uso
(define archivo1 (archivo "nombre1" "texto1"))
(define archivo2 (archivo "nombre2" "texto2"))
(define zona1 (workspace archivo1 archivo2))
(define nuevazona ((agregarA (archivo"nombre3" "texto3"))zona1))