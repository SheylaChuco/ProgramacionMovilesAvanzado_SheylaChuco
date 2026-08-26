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
