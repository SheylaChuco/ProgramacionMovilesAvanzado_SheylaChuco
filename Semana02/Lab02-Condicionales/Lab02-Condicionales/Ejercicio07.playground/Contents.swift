//Sheyla chuco Bravo
//Sección : A
// ===== EJERCICIO 7: JUEGO DE ADIVINANZA (asistido por IA) =====
let numeroSecreto = 42 // Define el número secreto fijo que el jugador debe adivinar.

let intento1 = 20 // Define el primer intento simulado con el número 20.
let intento2 = 50 // Define el segundo intento simulado con el número 50.
let intento3 = 35 // Define el tercer intento simulado con el número 35.
let intento4 = 45 // Define el cuarto intento simulado con el número 45.
let intento5 = 42 // Define el quinto intento simulado con el número 42.

let intentos = [intento1, intento2, intento3, intento4, intento5] // Guarda los cinco intentos en un arreglo para recorrerlos con while.

var posicion = 0 // Inicializa la posición en cero para comenzar con el primer intento.
var cantidadIntentos = 0 // Inicializa en cero el contador que registrará los intentos realizados.
var adivinado = false // Indica inicialmente que el jugador todavía no ha adivinado el número secreto.

print("===== JUEGO DE ADIVINANZA =====") // Muestra el título del juego de adivinanza.
print("El número secreto está entre 1 y 100.") // Informa el rango utilizado para el número secreto.
print("Tienes 5 intentos para adivinarlo.") // Informa que el jugador dispone de cinco intentos.

while posicion < intentos.count && adivinado == false { // Repite el juego mientras existan intentos disponibles y todavía no se haya acertado.
    
    let numeroIngresado = intentos[posicion] // Obtiene del arreglo el número correspondiente al intento actual.
    cantidadIntentos += 1 // Aumenta en uno el contador porque se está realizando un nuevo intento.
    
    print("") // Deja una línea vacía para separar visualmente cada intento.
    print("Intento \(cantidadIntentos): \(numeroIngresado)") // Muestra el número utilizado en el intento actual.
    
    if numeroIngresado > numeroSecreto { // Comprueba si el número ingresado es mayor que el número secreto.
        print("Muy alto") // Informa que el número ingresado es mayor que el número secreto.
    } else if numeroIngresado < numeroSecreto { // Comprueba si el número ingresado es menor que el número secreto.
        print("Muy bajo") // Informa que el número ingresado es menor que el número secreto.
    } else { // Ejecuta esta opción cuando el número ingresado coincide exactamente con el número secreto.
        print("¡Correcto!") // Informa que el jugador consiguió adivinar el número secreto.
        adivinado = true // Cambia el estado a verdadero para indicar que el jugador ya ganó.
    }
    
    posicion += 1 // Avanza a la posición del siguiente intento disponible.
}

if adivinado { // Comprueba si el jugador logró adivinar el número secreto dentro de los cinco intentos.
    print("") // Deja una línea vacía antes del mensaje de victoria.
    print("¡Ganaste!") // Muestra el mensaje indicando que el jugador ganó.
    print("Necesitaste \(cantidadIntentos) intento(s).") // Muestra la cantidad de intentos utilizados para conseguir la respuesta correcta.
} else { // Ejecuta esta alternativa cuando los cinco intentos terminaron sin acertar.
    print("") // Deja una línea vacía antes del mensaje de derrota.
    print("Perdiste. El número era: \(numeroSecreto)") // Muestra en una sola línea el mensaje de derrota y revela el número secreto correcto.
}

