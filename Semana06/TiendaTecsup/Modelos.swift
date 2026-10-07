
import UIKit

class Producto {
    let nombre: String
    let precio: Double
    var stock: Int

    init(nombre: String, precio: Double, stock: Int) {
        self.nombre = nombre
        self.precio = precio
        self.stock = stock
    }
}

class ItemCarrito {
    let producto: Producto
    var cantidad: Int

    init(producto: Producto, cantidad: Int) {
        self.producto = producto
        self.cantidad = cantidad
    }

    // cada línea sabe calcular su propio subtotal
    func subtotal() -> Double {
        return producto.precio * Double(cantidad)
    }
}

class CarritoModel {
    var items: [ItemCarrito] = []
    // A1: agrega un producto al carrito. Devuelve false si se pasa del stock
    func agregar(producto: Producto, cantidad: Int) -> Bool {
        // busca si ese producto ya tiene una línea en el carrito
        // (=== compara si es el MISMO objeto)
        let lineaExistente = items.first(where: { $0.producto === producto })

        // cuántas unidades de ese producto ya hay (0 si no está)
        let yaEnCarrito = lineaExistente?.cantidad ?? 0

        // si lo que ya hay + lo nuevo supera el stock, no agrega nada
        if yaEnCarrito + cantidad > producto.stock {
            return false
        }

        if let linea = lineaExistente {
            // ya estaba: suma a su línea (no crea una repetida)
            linea.cantidad += cantidad
        } else {
            // no estaba: crea una línea nueva
            items.append(ItemCarrito(producto: producto, cantidad: cantidad))
        }
        return true
    }
    // A2: suma los subtotales de todas las líneas
    func subtotal() -> Double {
        var total = 0.0
        for item in items {
            total += item.subtotal()
        }
        return total
    }
    // A3: porcentaje de descuento según el subtotal (de mayor a menor)
    func porcentajeDescuento() -> Double {
        let sub = subtotal()
        if sub >= 5000 {
            return 0.15
        } else if sub >= 2000 {
            return 0.10
        } else if sub >= 500 {
            return 0.05
        } else {
            return 0.0
        }
    }
    // A4: suma las cantidades de todas las líneas
    func cantidadTotal() -> Int {
        var total = 0
        for item in items {
            total += item.cantidad
        }
        return total
    }
    // A5: deja el carrito sin líneas
    func vaciar() {
        items.removeAll()
    }
}
