# Prompts utilizados — Laboratorio 02
## Sheyla Rosmery Chuco Bravo - sección A
## Herramienta de IA utilizada
Chat GPT

## Ejercicio 6 — Carrito mejorado

### Prompt (estructura CTRFE):
CONTEXTO: Tengo un carrito de compras en Swift con 5 productos (nombre, precio,
cantidad), que ya calcula subtotales, descuento por monto, categoría de cliente
y total con IGV.

TAREA: Mejora el carrito agregando estas 5 funcionalidades:
1. Descuento por cantidad: si se compran 3 o más unidades del mismo producto,
   aplicar 5% extra de descuento en ese producto específico.
2. Cupón de descuento: si el código ingresado es "DESCUENTO20", aplicar 20%
   adicional sobre el total.
3. Envío gratis: si el total supera S/. 3000, el envío es gratis; si no, cuesta S/. 25.00.
4. Puntos de fidelidad: por cada S/. 100 de compra, el cliente gana 1 punto.
5. Validación: si algún precio es negativo o alguna cantidad es 0, mostrar un
   mensaje de error.

RESTRICCIONES: Usa Swift válido para Playground (sin UIKit ni SwiftUI).
Cada línea de código debe tener un comentario explicando específicamente
qué hace esa línea (no comentarios genéricos como "calcula algo").

FORMATO: Código completo en un solo bloque, listo para pegar en un Playground.

EJEMPLO: Producto "Mouse" con cantidad 2 y precio 45.50 → subtotal = 91.0,
sin descuento por cantidad (necesita 3+). Si cantidad fuera 3, el descuento
de 5% se aplica solo a ese producto.

### ¿Funcionó a la primera?
No del todo. La IA generó correctamente las 5 funcionalidades pedidas, pero
la función `validarProducto` quedó "suelta": calculaba si un producto era
válido pero no detenía el flujo del carrito si algo era inválido. Tuve que
agregar manualmente una verificación (`if !prod1Valido || !prod2Valido...`)
para que la validación realmente afectara el resultado.

### ¿La IA usó algo que no conocías?
Sí — usó una función (`func`) con parámetros nombrados para encapsular el
cálculo del subtotal con descuento por cantidad, en vez de repetir la misma
lógica if/else para cada producto. Investigué la sintaxis de funciones en
Swift (`func nombre(param: Tipo) -> TipoRetorno`) para entender bien cómo
se estaba reutilizando ese cálculo.

## Ejercicio 7 — Juego de adivinanza

### Prompt (estructura CTRFE):
CONTEXTO: Estoy en un Playground de Swift y quiero simular un mini juego de
adivinanza de números, sin poder pedir input real del usuario.

TAREA: Genera un juego donde hay un número secreto fijo y se simulan 5
intentos usando variables predefinidas. En cada intento debe indicar si el
número ingresado es "Muy alto", "Muy bajo" o "¡Correcto!". Debe contar
cuántos intentos se necesitaron y, si no se adivina en los 5 intentos,
mostrar un mensaje de "Perdiste" con el número correcto.

RESTRICCIONES: Usa un bucle while (no for) para recorrer los intentos.
Comenta CADA línea explicando la lógica de comparación específica de esa
línea.

FORMATO: Código completo en un solo bloque, listo para pegar en un
Playground.

EJEMPLO: Si el número secreto es 42 y el intento es 20, debe imprimir
"Muy bajo".

### ¿Funcionó a la primera?
Sí, la lógica del while y las comparaciones (mayor/menor/igual) funcionaron
correctamente desde el primer intento. Solo ajusté el mensaje final para
que restara 1 al contador de intentos, porque el bucle incrementa el
contador una vez más antes de salir, y el mensaje original mostraba un
intento de más.

### ¿La IA usó algo que no conocías?
Sí — la condición combinada `numeroDeIntento <= 5 && !adivino` en el while,
usando el operador `!` para negar un Bool directamente en la condición del
bucle. Repasé cómo `!variable` invierte el valor booleano para entender por
qué el bucle se detiene apenas `adivino` pasa a `true`.
