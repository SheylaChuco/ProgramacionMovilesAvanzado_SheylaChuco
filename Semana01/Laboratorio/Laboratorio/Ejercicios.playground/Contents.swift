import Foundation

// Un Calendario de Pagos

// ingresar el nombre del producto, precio, cantidad

let igv = 0.18

func CalcularDescuento(cantidad: Int, subtotal: Double) -> Double {
    
    if cantidad > 10 {
        return subtotal * 0.15
    } else if cantidad > 5 {
        return subtotal * 0.10
    } else {
        return 0.0
    }
}

print("Ingrese el nombre del producto")
let producto = readLine() ?? ""

print("Ingrese el precio del producto")
let precio = Double(readLine() ?? "0") ?? 0.0

print("Ingrese la cantidad del producto")
let cantidad = Int(readLine() ?? "0") ?? 0

let subtotal = precio * Double(cantidad)

let descuento = CalcularDescuento(cantidad: cantidad, subtotal: subtotal)

// hallar el monto base: subtotal - descuento
let montoBase = subtotal - descuento

// hallar el IGV: montoBase * igv
let montoIGV = montoBase * igv

// total: montoBase + IGV
let total = montoBase + montoIGV

// primer commit

// mostrar los datos
print("-----------------------------")
print("Producto: \(producto)")
print("Precio: S/ \(precio)")
print("Cantidad: \(cantidad)")
print("Subtotal: S/ \(subtotal)")
print("Descuento: S/ \(descuento)")
print("Monto base: S/ \(montoBase)")
print("IGV: S/ \(montoIGV)")
print("Total a pagar: S/ \(total)")
print("-----------------------------")

// segundo commit

