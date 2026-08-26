


//Necesito realizar un calendario de pagos con los sgtes detalles pedire para que el usuario ingrese lo sgte: Nombre de Producto,Precio Unitario,Cantidad ,luego se le mostrara el monto total de la compra (que el sistema lo calucla como salida para que lo visualize y este se calcula(precio * cantidad)
//luego se le muestra el plan de pago donde el usuario eligira el tiempo que seran:
//6->20%
//12->40%
//24->60%
//Una vez el usuario elija el plan de pago se le mostrara el plan de pago con los sgtes datos:
//Producto
//Monto Compra
//Interes
//Monto Final
//Cuota Mensual

//tambien se mostrara el cuadro que tengo los sgtes datos: Mes ,MontoInicial,CuotaMensual,Resta x Pago
//todo esto se desarrollara en xcode con el lenguaje swift y sincronzado con una repo en github para ello para este ejercicio se necesita desarrollarlo en 4 commit organizado y desarrollalo entiendes los que se quiere desarrollar

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
print("===== TU PLAN DE PAGO =====")
print("Producto: \(producto)")
print("Monto de compra: S/ \(montoCompra)")
print("Interés: S/ \(interes)")
print("Monto final: S/ \(montoFinal)")
print("Cuota mensual: S/ \(cuotaMensual)")
