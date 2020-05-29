#lang racket

(require "TDAlocalrepository.rkt")
(require "TDAcommit.rkt")
(require "TDAarchivo.rkt")
(require "TDAworkspace.rkt")
(require "tdaindex.rkt")

(require racket/date)
(provide add)
(provide git)

;Uso de las funciones y para ocupar de ejemplo
(define archivo1 (archivo "nombre1" "texto1"))
(define archivo2 (archivo "nombre2" "texto2"))
(define zona1 (workspace archivo1 archivo2))

;FUNCION Zona
;descripción:  Funcion que va mostrando la zonas de trabajo y sus cambios despues de aplicar las funciones de git
;dom: las 4 zonas de trabajo
;rec:nueva version de zonas,con los cambios reflejados
(define zonas (lambda (w i lo re)
             (list
                   "Workspace" w 
                   "Index "    i
                   "LocalRepository "    lo
                   "RemotoRepository "   re
                   )
                ))

;FUNCION ADD
;descripción:  Función que añade los cambios locales registrados en el
;              Workspace al Index registrados en las zonas de trabajo.
;              Para esto la funcion recibe de parametro el nombre del archivo el cual es comparado
;              con lo que hay en workspace si coinciden se añade al index
;dom:lista X zonas
;rec:nueva version de zonas,con los cambios reflejados
;tipo de recusión: de cola
;Ejemplo de uso: ((add (list "nombre1"))zona1)

(define add (lambda (lista)
             (lambda (zona)
        (if (null? lista)
            null
            (if (string? (car lista))
                       (if (equal? lista (getNombre (car zona))) 
                           (zonas zona  (index (getNombre(car zona))) null null)
 
                           ((add lista) (cdr zona )))
                       ((add lista) ( cdr zona)) )))))




;FUNCION Push
;descripción:  Función que envía los commit desde el repositorio
;              local al repositorio remoto registrado en las zonas de trabajo
;dom: zonas
;rec:nueva version de zonas,con los cambios reflejados
(define push (lambda (zona)
              
                  (if (list? zona)

                     (zonas (cadr zona)  null null  (list-ref zona 5)     )
      "funcion mal ejecutada"
      ) 
    ))



;FUNCION Commit
;descripción: Función que genera un commit con los cambios almacenados en
;             index especificando un mensaje descriptivo (un string) para llevarlos al LocalRepository.            
;dom:string X zonas
;rec:nueva version de zonas,con los cambios reflejados
;Ejemplo de uso: (((git add) (list "nombre1"))zona1)
;                (((git commit)"mensaje de commit")zona2)
(define commit (lambda (string)
                 (lambda (zona)
                  (if (and (string? string)(list? zona))
        (zonas (cadr zona) (car(list-ref(cddr zona )1))
               (Repository( list string  (car(list-ref(cddr zona )1))))null)
      "Commit formato incorrecto"
      ) 
    )))



;FUNCION GIT
;descripción:  Función que permite aplicar los comandos (funciones en este caso)
;              en el contexto de git sobre las zonas de trabajo.
;dom:funcion X zonas
;rec:recorrido de la funcion
;Ejemplo de uso: (((git add) (list "nombre1"))zona1)
;                (((git commit)"mensaje de commit")zona2)
(define git (lambda (funcion)
              (lambda (zonas)
                (funcion zonas)
                
              )))

;FUNCION GIT con registro de fecha
;descripción:  Función que permite aplicar los comandos (funciones en este caso)
;              en el contexto de git sobre las zonas de trabajo.
;              Esta funcion permite obtener la fecha de cuando se realiza la ejecucion
;dom:funcion X zona
;rec:recorrido de la funcion
(define fecha (date->string (current-date) second))
(define gitFecha(lambda (git)
               (list git fecha)))

;Ejemplo de como se deben ir guardando la zonas de trabajo para su posterior uso
(define zona2 (((git add) (list "nombre1"))zona1))
(define zona3  (((git commit)"mensaje de commit")zona2))