import Foundation
import SwiftData

@Model
class Compra {
    var fecha: Date
    var cantidad: Int
    var costoUnitario: Double
    var igv: Double
    var total: Double
    var alCredito: Bool
    var vence: Date
    var estado: String        // "Pendiente", "Aprobada" o "Rechazada"
    var pagada: Bool
    var motivoRechazo: String?

    // Una compra apunta a un comprador, un proveedor y un producto
    var comprador: Usuario?
    var proveedor: Proveedor?
    var producto: Producto?

    init(fecha: Date = .now,
         cantidad: Int,
         costoUnitario: Double,
         igv: Double,
         total: Double,
         alCredito: Bool,
         vence: Date,
         estado: String,
         pagada: Bool,
         motivoRechazo: String? = nil,
         comprador: Usuario? = nil,
         proveedor: Proveedor? = nil,
         producto: Producto? = nil) {
        self.fecha = fecha
        self.cantidad = cantidad
        self.costoUnitario = costoUnitario
        self.igv = igv
        self.total = total
        self.alCredito = alCredito
        self.vence = vence
        self.estado = estado
        self.pagada = pagada
        self.motivoRechazo = motivoRechazo
        self.comprador = comprador
        self.proveedor = proveedor
        self.producto = producto
    }
}

