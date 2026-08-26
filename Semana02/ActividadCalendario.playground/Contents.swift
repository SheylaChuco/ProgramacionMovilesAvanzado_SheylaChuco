import Foundation

// CALENDARIO DE PAGOS

print("===== DATOS DEL PRODUCTO =====")

print("Ingrese el nombre del producto:")
let producto = readLine() ?? ""

print("Ingrese el precio unitario:")
let precio = Double(readLine() ?? "0") ?? 0.0

print("Ingrese la cantidad:")
let cantidad = Int(readLine() ?? "0") ?? 0

let montoCompra = precio * Double(cantidad)

print("")
print("===== RESUMEN DE COMPRA =====")
print("Producto: \(producto)")
print("Precio unitario: S/ \(precio)")
print("Cantidad: \(cantidad)")
print("Monto total de compra: S/ \(montoCompra)")

print("")
print("===== PLAN DE PAGO =====")
print("6  meses -> 20% de interés")
print("12 meses -> 40% de interés")
print("24 meses -> 60% de interés")

print("")
print("Ingrese el número de meses:")
let meses = Int(readLine() ?? "0") ?? 0

var porcentajeInteres = 0.0

if meses == 6 {
    porcentajeInteres = 0.20
} else if meses == 12 {
    porcentajeInteres = 0.40
} else if meses == 24 {
    porcentajeInteres = 0.60
} else {
    print("Plan de pago no válido")
}

print("Meses seleccionados: \(meses)")
print("Interés: \(porcentajeInteres * 100)%")

let interes = montoCompra * porcentajeInteres
let montoFinal = montoCompra + interes
let cuotaMensual = montoFinal / Double(meses)

print("")
print("===== PLAN DE PAGO =====")
print("Producto: \(producto)")
print("Monto de compra: S/ \(montoCompra)")
print("Interés: S/ \(interes)")
print("Monto final: S/ \(montoFinal)")
print("Cuota mensual: S/ \(cuotaMensual)")


print("")
print("===== TU CALENDARIO DE PAGOS =====")

print("Mes\tMonto Inicial\tCuota Mensual\tResta x Pago")

var montoPendiente = montoFinal

for mes in 1...meses {
    
    let montoInicial = montoPendiente
    
    montoPendiente = montoPendiente - cuotaMensual
    
    if montoPendiente < 0 {
        montoPendiente = 0
    }
    
    print("\(mes)\tS/ \(montoInicial)\tS/ \(cuotaMensual)\tS/ \(montoPendiente)")
}
