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
// INICIO DEL COMMIT 2
// ADELANTO DE PAGO
// ============================================================

var respuestaAdelanto = ""

// VALIDAR SI / NO

while respuestaAdelanto != "SI" && respuestaAdelanto != "NO" {
    
    print("")
    print("¿Tienes pensado realizar un adelanto de pago? (SI/NO):")
    
    respuestaAdelanto = (readLine() ?? "").uppercased()
    
    if respuestaAdelanto != "SI" && respuestaAdelanto != "NO" {
        print("Respuesta no válida.")
        print("Por favor, ingrese SI o NO.")
    }
}

// VARIABLES DEL ADELANTO

var mesAdelanto = 0
var montoAdelanto = 0.0

// SI QUIERE REALIZAR UN ADELANTO

if respuestaAdelanto == "SI" {
    
    print("")
    print("===== MESES DEL PLAN =====")
    print("")
    print("Mes\tFecha")
    
    // CONFIGURAR FECHAS
    
    let calendario = Calendar.current
    let fechaActual = Date()
    
    let formatoFecha = DateFormatter()
    formatoFecha.dateFormat = "dd/MM/yyyy"
    
    // MOSTRAR LOS MESES DISPONIBLES
    
    for mes in 1...meses {
        
        if let fechaPago = calendario.date(
            byAdding: .month,
            value: mes,
            to: fechaActual
        ) {
            
            print("\(mes)\t\(formatoFecha.string(from: fechaPago))")
        }
    }
    
    // SELECCIONAR MES
    
    print("")
    print("¿En qué mes hará un pago adelantado?")
    mesAdelanto = Int(readLine() ?? "0") ?? 0
    
    // VALIDAR MES
    
    while mesAdelanto < 1 || mesAdelanto > meses {
        
        print("")
        print("Mes no válido.")
        print("Ingrese un número entre 1 y \(meses):")
        
        mesAdelanto = Int(readLine() ?? "0") ?? 0
    }
    
    // PEDIR MONTO DEL ADELANTO
    
    print("")
    print("Ingrese el monto a pagar ese mes (S/):")
    montoAdelanto = Double(readLine() ?? "0") ?? 0.0
    
    // VALIDAR MONTO
    
    while montoAdelanto <= 0 {
        
        print("")
        print("Monto no válido.")
        print("El monto debe ser mayor que S/ 0.00.")
        
        print("")
        print("Ingrese el monto a pagar ese mes (S/):")
        montoAdelanto = Double(readLine() ?? "0") ?? 0.0
    }
    
    // MOSTRAR INFORMACIÓN DEL ADELANTO
    
    print("")
    print("===== ADELANTO REGISTRADO =====")
    
    print("Mes del adelanto: \(mesAdelanto)")
    print("Monto del adelanto: S/ \(String(format: "%.2f", montoAdelanto))")
}

// ============================================================
// FIN DEL COMMIT 2
// ============================================================
