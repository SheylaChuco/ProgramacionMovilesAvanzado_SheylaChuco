import Foundation
import SwiftData

// Reglas de negocio de la app Compras
enum Reglas {
    static let tasaIGV = 0.18
    static let limiteAprobacion = 5000.0
    static let diasCredito = 30

    static func redondear(_ valor: Double) -> Double {
        (valor * 100).rounded() / 100
    }

    // IGV = 18 % del subtotal (cantidad x costo unitario)
    static func igv(subtotal: Double) -> Double {
        redondear(subtotal * tasaIGV)
    }

    // Desde S/ 5,000 la compra queda Pendiente y la aprueba el supervisor
    static func requiereAprobacion(total: Double) -> Bool {
        total >= limiteAprobacion
    }

    // Costo promedio ponderado:
    // (stock actual x costo promedio + cantidad x costo unitario) / (stock actual + cantidad)
    static func nuevoCostoPromedio(stock: Int, costoPromedio: Double, cantidad: Int, costoUnitario: Double) -> Double {
        let unidades = stock + cantidad
        guard unidades > 0 else { return costoUnitario }
        let valor = Double(stock) * costoPromedio + Double(cantidad) * costoUnitario
        return redondear(valor / Double(unidades))
    }

    // Contado vence el mismo día; crédito vence a los 30 días
    static func fechaVencimiento(desde fecha: Date, alCredito: Bool) -> Date {
        guard alCredito else { return fecha }
        return Calendar.current.date(byAdding: .day, value: diasCredito, to: fecha) ?? fecha
    }

    // Vencida = a crédito, aprobada, sin pagar y con la fecha de vencimiento ya pasada
    static func estaVencida(_ compra: Compra, hoy: Date = .now) -> Bool {
        compra.alCredito && compra.estado == "Aprobada" && !compra.pagada && compra.vence < hoy
    }

    // Efectos de una compra aprobada: actualiza costo promedio y stock del producto.
    // Primero se calcula el costo con el stock anterior y después se suma el stock.
    static func aplicarEfectos(de compra: Compra) {
        guard let producto = compra.producto else { return }
        producto.costoPromedio = nuevoCostoPromedio(
            stock: producto.stock,
            costoPromedio: producto.costoPromedio,
            cantidad: compra.cantidad,
            costoUnitario: compra.costoUnitario
        )
        producto.stock += compra.cantidad
    }
}

// Valores calculados a partir de las compras de un proveedor
extension Proveedor {
    var totalComprado: Double {
        compras.filter { $0.estado == "Aprobada" }.reduce(0) { $0 + $1.total }
    }

    var totalPorPagar: Double {
        compras.filter { $0.estado == "Aprobada" && !$0.pagada }.reduce(0) { $0 + $1.total }
    }
}

extension Double {
    var soles: String {
        "S/ " + formatted(.number.precision(.fractionLength(2)))
    }
}

extension String {
    var recortado: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

