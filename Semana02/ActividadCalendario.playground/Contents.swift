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
print("Precio unitario: S/ \(String(format: "%.2f", precio))")
print("Cantidad: \(cantidad)")
print("Monto total de compra: S/ \(String(format: "%.2f", montoCompra))")

print("")

print("===== PLAN DE PAGO =====")

print("6 meses  -> 20% de interés")
print("12 meses -> 40% de interés")
print("24 meses -> 60% de interés")

print("")

// VALIDACIÓN DEL PLAN

var meses = 0
var porcentajeInteres = 0.0

while meses != 6 && meses != 12 && meses != 24 {
    
    print("Ingrese el número de meses:")
    meses = Int(readLine() ?? "0") ?? 0
    
    if meses == 6 {
        porcentajeInteres = 0.20
    } else if meses == 12 {
        porcentajeInteres = 0.40
    } else if meses == 24 {
        porcentajeInteres = 0.60
    } else {
        print("")
        print("Plan de pago no válido.")
        print("Por favor, seleccione 6, 12 o 24 meses.")
        print("")
    }
}

// CÁLCULOS

let interes = montoCompra * porcentajeInteres
let montoFinal = montoCompra + interes
let cuotaMensual = montoFinal / Double(meses)

print("")
print("===== PLAN DE PAGO =====")

print("Producto: \(producto)")
print("Monto de compra: S/ \(String(format: "%.2f", montoCompra))")
print("Interés: S/ \(String(format: "%.2f", interes))")
print("Monto final: S/ \(String(format: "%.2f", montoFinal))")
print("Cuota mensual: S/ \(String(format: "%.2f", cuotaMensual))")

// ============================================================
// GENERAR CALENDARIO
// ============================================================

let calendario = Calendar.current
let fechaActual = Date()

let formatoFecha = DateFormatter()
formatoFecha.dateFormat = "dd/MM/yyyy"

print("")
print("===== CALENDARIO DE PAGOS =====")
print("")

print("Mes\tFecha\t\tMonto Inicial\tPago\t\tResta por Pagar")

var montoPendiente = montoFinal

for mes in 1...meses {
    
    let montoInicial = montoPendiente
    
    montoPendiente = montoPendiente - cuotaMensual
    
    if abs(montoPendiente) < 0.01 {
        montoPendiente = 0
    }
    
    var fechaPago = ""
    
    if let fecha = calendario.date(
        byAdding: .month,
        value: mes,
        to: fechaActual
    ) {
        fechaPago = formatoFecha.string(from: fecha)
    }
    
    print(
        "\(mes)\t\(fechaPago)\tS/ \(String(format: "%.2f", montoInicial))\tS/ \(String(format: "%.2f", cuotaMensual))\tS/ \(String(format: "%.2f", montoPendiente))"
    )
}

// ============================================================
// FIN DEL COMMIT 3
// ============================================================
