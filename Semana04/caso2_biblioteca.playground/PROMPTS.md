# Prompts utilizados — Laboratorio 04
##Sheyla Chuco Bravo
## Herramienta de IA utilizada
Claude

## Caso 2B — Biblioteca

### Prompt 1:
CONTEXTO: Soy estudiante de Swift, cuarta semana, trabajo en un Playground de Xcode.

TAREA: Necesito una biblioteca con:
- enum EstadoLibro con casos .disponible y .prestado
- struct Libro con titulo (String), autor (String) y estado (EstadoLibro, empieza en .disponible)
- class Biblioteca con var libros: [Libro] (empieza vacía) y los métodos:
  - agregar(libro:) que añade al array
  - prestar(titulo: String) -> Bool: busca el libro por título recorriendo el array por índice, si existe y está disponible lo marca prestado, imprime "Préstamo aprobado: [titulo]" y devuelve true; si ya está prestado imprime "Error: [titulo] ya está prestado" y devuelve false; si no existe imprime "Error: no existe [titulo]" y devuelve false
  - devolver(titulo: String) -> Bool con la lógica inversa
  - inventario() que imprime cada libro con autor y estado usando switch

RESTRICCIONES: Solo struct, class, herencia, protocolos, enums, arrays, bucles y funciones. Sin optionals ni guard let, sin firstIndex(where:), sin didSet, sin propiedades calculadas, sin genéricos.

FORMATO: Solo el código Swift, con las firmas exactas que te indico arriba.

EJEMPLO (salida esperada con esta simulación: agregar "Cien años de soledad", "La ciudad y los perros", "El Quijote"; prestar "La ciudad y los perros" dos veces; devolverlo; prestar "El Quijote"; intentar prestar "El Principito"; mostrar inventario):

Préstamo aprobado: La ciudad y los perros
Error: La ciudad y los perros ya está prestado
Devolución registrada: La ciudad y los perros
Préstamo aprobado: El Quijote
Error: no existe El Principito
===== INVENTARIO =====
Cien años de soledad (Gabriel García Márquez) - disponible
La ciudad y los perros (Mario Vargas Llosa) - disponible
El Quijote (Miguel de Cervantes) - prestado

### Respuesta de la IA:
La IA generó la clase Biblioteca con el enum, el struct y los métodos pedidos.
La lógica y la salida en consola eran correctas, pero para buscar el libro por
título usó firstIndex(where: { $0.titulo == titulo }) (closures) y guard let
(optionals) en lugar del bucle por índice pedido en las restricciones.

### ¿Funcionó a la primera?
No. La salida coincidía con la esperada, pero usaba conceptos no vistos en
clase todavía. Prompt de corrección usado: "Reescribe la búsqueda sin closures
ni optionals, usando un bucle for i in 0..<libros.count y comparando
directamente el título en cada posición, tal como lo hicimos en labs
anteriores del curso."

### ¿Usó algo que no hemos visto en clase?
Sí: firstIndex(where:) (closures) y guard let (optionals). Se le pidió
reescribir ambos métodos (prestar y devolver) con un bucle for i in
0..<libros.count y comparaciones directas con if, sin optionals.

## Mi versión (Parte A) vs. la versión de la IA (Parte B)

### ¿Qué hizo distinto la IA respecto a mi solución?
En su primera respuesta, la IA resolvió la búsqueda del libro con
firstIndex(where:) y guard let, una forma más compacta pero que usa closures
y optionals — temas que aún no hemos visto en el curso. Mi versión (Parte A)
usa un bucle for i in 0..<libros.count con comparaciones if, que es más
explícito aunque un poco más largo.

### ¿Hay alguna línea de la IA que no entiendo del todo? ¿Cuál?
La sintaxis guard let index = libros.firstIndex(where: { $0.titulo == titulo })
else { ... } de la primera respuesta no la entendía completamente, en
particular qué es $0 dentro del closure.

### ¿Qué me pareció mejor de MI versión?
Es más fácil de seguir paso a paso porque uso solo herramientas que ya domino
(bucles e if), y puedo explicar cada línea sin dudas.

### ¿Qué me pareció mejor de la versión de la IA?
La primera respuesta era más corta y resolvía la búsqueda en una sola línea,
lo cual muestra que hay formas más compactas de hacer lo mismo una vez que
se aprenden closures y optionals más adelante en el curso.
