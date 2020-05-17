#lang racket
;TDA Archivos
;representacion
;(list string string)
;(list "archivo1" "texto1") 

;CONSTRUCTOR
;descripción: Permite crear un archivo
;dom: string X string
;rec: lista
(define archivo (lambda (l1 l2)
                  (if (and (string? l1)(string? l2))
      (list l1 l2)
      "Archivo formato incorrecto"
      ) 
    ))
;PERTENENCIA
;descripción: Función que permite determinar si el constructor archivo esta bien implementado
;dom: lista
;rec: boolean
(define (archivo? archivo)
  (if (list? archivo)
      #t
      #f
      ))

;SELECTORES
;descripción: Función que retorna el nombre del archivo
;dom: archivo
;rec: string 
(define (getNombre a)
   (if (archivo? a)
       (car a)
       0
   )
 )
;descripción: Función que retorna el texto del archivo
;dom: archivo
;rec: string 
(define (getTexto a)
   (if (archivo? a)
       (cadr a)
       0
   )
 )

;Modificadores
;descripción: Función que crea un nuevo nombre a la funcion archivo
;dom: lista X string
;rec: lista
(define (setNombre a nuevoNombre)
  (if (archivo? a)
      (archivo nuevoNombre (getTexto a))
      null
   )
 )
;descripción: Función que crea un nuevo texto a la funcion archivo
;dom: lista X string
;rec: lista
(define (setTexto a nuevoTexto)
  (if (archivo? a)
      (archivo (getNombre a)nuevoTexto)
      null
   )
 )
