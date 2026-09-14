//Nombre :Sheyla Rosmery Chuco Bravo
//Sección A
import Foundation // Importa Foundation para utilizar String(format:) y formatear los valores monetarios.

// ===== ESTRUCTURA DEL PRODUCTO =====

struct Producto { // Define una estructura para almacenar los datos de cada producto.
    let nombre: String // Guarda el nombre que identifica al producto.
    let precio: Double // Guarda el precio de una unidad del producto.
    let cantidad: Int // Guarda la cantidad de unidades que el cliente compra.
}

// ===== REGISTRO DE LOS 5 PRODUCTOS =====

let producto1 = Producto(nombre: "Mouse", precio: 45.50, cantidad: 2) // Registra el Mouse con precio S/. 45.50 y cantidad de 2 unidades.
let producto2 = Producto(nombre: "Teclado", precio: 120.00, cantidad: 3) // Registra el Teclado con precio S/. 120.00 y cantidad de 3 unidades.
let producto3 = Producto(nombre: "Monitor", precio: 850.00, cantidad: 1) // Registra el Monitor con precio S/. 850.00 y cantidad de 1 unidad.
let producto4 = Producto(nombre: "Laptop", precio: 2500.00, cantidad: 1) // Registra la Laptop con precio S/. 2500.00 y cantidad de 1 unidad.
let producto5 = Producto(nombre: "Audífonos", precio: 180.00, cantidad: 4) // Registra los Audífonos con precio S/. 180.00 y cantidad de 4 unidades.

let productos = [producto1, producto2, producto3, producto4, producto5] // Agrupa los cinco productos registrados en un arreglo para recorrerlos.

// ===== DATOS DEL CLIENTE Y CUPÓN =====

let categoriaCliente = "Frecuente" // Define la categoría del cliente para determinar el descuento correspondiente.
let codigoCupon = "DESCUENTO20" // Guarda el código de cupón ingresado para verificar si obtiene el 20% adicional.

// ===== VALIDACIÓN DE LOS PRODUCTOS =====

var carritoValido = true // Inicializa el estado del carrito como válido antes de revisar los productos.

for producto in productos { // Recorre cada producto del carrito para validar su precio y cantidad.
    if producto.precio < 0 { // Comprueba si el precio del producto es menor que cero.
        print("ERROR: El precio de \(producto.nombre) no puede ser negativo.") // Muestra el nombre del producto cuyo precio es inválido.
        carritoValido = false // Cambia el estado del carrito a inválido porque existe un precio negativo.
    }
    
    if producto.cantidad == 0 { // Comprueba si la cantidad registrada para el producto es exactamente cero.
        print("ERROR: La cantidad de \(producto.nombre) no puede ser 0.") // Muestra el nombre del producto cuya cantidad es inválida.
        carritoValido = false // Cambia el estado del carrito a inválido porque existe una cantidad igual a cero.
    }
}

// ===== CÁLCULO DEL CARRITO =====

if carritoValido { // Ejecuta los cálculos solamente cuando todos los productos pasan la validación.
    
    var subtotalCarrito = 0.0 // Inicializa en cero el subtotal acumulado de todos los productos.
    var descuentoCantidadTotal = 0.0 // Inicializa en cero el acumulado de descuentos del 5% por cantidad.
    
    print("========== DETALLE DE PRODUCTOS ==========") // Muestra el título de la sección donde se detallan los productos.
    
    for producto in productos { // Recorre cada producto para calcular su subtotal y descuento individual.
        let subtotal = producto.precio * Double(producto.cantidad) // Multiplica el precio unitario por la cantidad comprada para obtener el subtotal.
        
        var descuentoCantidad = 0.0 // Inicializa en cero el descuento especial del producto actual.
        
        if producto.cantidad >= 3 { // Comprueba si el cliente compró tres o más unidades del mismo producto.
            descuentoCantidad = subtotal * 0.05 // Calcula el 5% de descuento solamente sobre el subtotal de ese producto.
        }
        
        let subtotalConDescuento = subtotal - descuentoCantidad // Resta el descuento por cantidad al subtotal del producto actual.
        
        subtotalCarrito += subtotalConDescuento // Acumula el subtotal ya descontado de cada producto en el carrito.
        
        descuentoCantidadTotal += descuentoCantidad // Acumula todos los descuentos del 5% aplicados por cantidad.
        
        print("Producto: \(producto.nombre)") // Muestra el nombre del producto que se está procesando.
        print("Cantidad: \(producto.cantidad)") // Muestra cuántas unidades de ese producto compró el cliente.
        print("Precio unitario: S/. \(String(format: "%.2f", producto.precio))") // Muestra el precio unitario del producto con dos decimales.
        print("Subtotal: S/. \(String(format: "%.2f", subtotal))") // Muestra el subtotal antes del descuento por cantidad.
        print("Descuento por cantidad: S/. \(String(format: "%.2f", descuentoCantidad))") // Muestra el 5% descontado cuando la cantidad es de tres o más unidades.
        print("Subtotal final del producto: S/. \(String(format: "%.2f", subtotalConDescuento))") // Muestra el precio final del producto después del descuento por cantidad.
        print("------------------------------------------") // Separa visualmente los datos de un producto de los siguientes.
    }
    
    // ===== DESCUENTO POR MONTO =====
    
    var descuentoMonto = 0.0 // Inicializa en cero el descuento que depende del monto acumulado del carrito.
    
    if subtotalCarrito >= 3000 { // Comprueba si el subtotal del carrito es igual o mayor a S/. 3000.
        descuentoMonto = subtotalCarrito * 0.10 // Aplica un descuento del 10% cuando la compra alcanza S/. 3000.
    } else if subtotalCarrito >= 1500 { // Comprueba si el subtotal está entre S/. 1500 y S/. 2999.99.
        descuentoMonto = subtotalCarrito * 0.05 // Aplica un descuento del 5% cuando la compra alcanza S/. 1500.
    }
    
    let totalDespuesDescuentoMonto = subtotalCarrito - descuentoMonto // Resta al subtotal el descuento correspondiente al monto de compra.
    
    // ===== DESCUENTO POR CATEGORÍA DEL CLIENTE =====
    
    var descuentoCategoria = 0.0 // Inicializa en cero el descuento correspondiente a la categoría del cliente.
    
    if categoriaCliente == "VIP" { // Comprueba si el cliente pertenece a la categoría VIP.
        descuentoCategoria = totalDespuesDescuentoMonto * 0.10 // Calcula un descuento del 10% para clientes VIP.
    } else if categoriaCliente == "Frecuente" { // Comprueba si el cliente pertenece a la categoría Frecuente.
        descuentoCategoria = totalDespuesDescuentoMonto * 0.05 // Calcula un descuento del 5% para clientes frecuentes.
    }
    
    let totalAntesCupon = totalDespuesDescuentoMonto - descuentoCategoria // Resta el descuento de categoría antes de comprobar el cupón.
    
    // ===== CUPÓN DE DESCUENTO =====
    
    var descuentoCupon = 0.0 // Inicializa en cero el descuento generado por el cupón.
    
    if codigoCupon == "DESCUENTO20" { // Comprueba si el código ingresado coincide exactamente con DESCUENTO20.
        descuentoCupon = totalAntesCupon * 0.20 // Calcula un descuento adicional del 20% sobre el total después de los descuentos anteriores.
    }
    
    let totalDespuesCupon = totalAntesCupon - descuentoCupon // Resta el 20% del cupón al total obtenido antes del cupón.
    
    // ===== COSTO DE ENVÍO =====
    
    var costoEnvio = 25.00 // Establece S/. 25.00 como costo de envío cuando no se cumple la condición de envío gratis.
    
    if totalDespuesCupon > 3000 { // Comprueba si el total de compra supera S/. 3000 para otorgar envío gratis.
        costoEnvio = 0.00 // Establece el costo de envío en cero porque la compra supera S/. 3000.
    }
    
    // ===== CÁLCULO DEL IGV =====
    
    let totalAntesIGV = totalDespuesCupon + costoEnvio // Suma el costo de envío al total después de aplicar todos los descuentos.
    
    let igv = totalAntesIGV * 0.18 // Calcula el IGV aplicando la tasa del 18% al monto correspondiente.
    
    let totalFinal = totalAntesIGV + igv // Suma el IGV al monto anterior para obtener el total final a pagar.
    
    // ===== PUNTOS DE FIDELIDAD =====
    
    let puntosFidelidad = Int(totalDespuesCupon / 100) // Calcula un punto por cada S/. 100 completos de compra.
    
    // ===== RESUMEN FINAL =====
    
    print("") // Deja una línea vacía para separar el detalle de productos del resumen.
    print("============= RESUMEN FINAL =============") // Muestra el título del resumen final de la compra.
    print("Subtotal después de descuentos por cantidad: S/. \(String(format: "%.2f", subtotalCarrito))") // Muestra el subtotal acumulado después de los descuentos por cantidad.
    print("Descuento por cantidad: S/. \(String(format: "%.2f", descuentoCantidadTotal))") // Muestra cuánto se ahorró en total por comprar tres o más unidades.
    print("Descuento por monto: S/. \(String(format: "%.2f", descuentoMonto))") // Muestra el descuento obtenido según el monto total de compra.
    print("Descuento por categoría: S/. \(String(format: "%.2f", descuentoCategoria))") // Muestra el descuento correspondiente a la categoría del cliente.
    print("Cupón utilizado: \(codigoCupon)") // Muestra el código de cupón que fue ingresado por el cliente.
    print("Descuento por cupón: S/. \(String(format: "%.2f", descuentoCupon))") // Muestra el 20% de descuento adicional obtenido mediante el cupón.
    print("Costo de envío: S/. \(String(format: "%.2f", costoEnvio))") // Muestra S/. 0.00 si el envío es gratis o S/. 25.00 si debe pagarse.
    print("IGV (18%): S/. \(String(format: "%.2f", igv))") // Muestra el IGV calculado con una tasa del 18%.
    print("TOTAL FINAL: S/. \(String(format: "%.2f", totalFinal))") // Muestra el monto final que debe pagar el cliente incluyendo envío e IGV.
    print("PUNTOS DE FIDELIDAD GANADOS: \(puntosFidelidad)") // Muestra los puntos obtenidos por cada S/. 100 completos de compra.
    print("==========================================") // Cierra visualmente el resumen de la compra.
}
