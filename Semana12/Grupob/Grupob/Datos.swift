import Foundation
import SwiftData

enum Datos {
    // Datos de ejemplo para probar rápido. Solo se crean si la base está vacía.
    static func sembrarSiVacio(_ contexto: ModelContext) {
        let productos = (try? contexto.fetchCount(FetchDescriptor<Producto>())) ?? 0
        let proveedores = (try? contexto.fetchCount(FetchDescriptor<Proveedor>())) ?? 0
        guard productos == 0, proveedores == 0 else { return }

        contexto.insert(Proveedor(nombre: "Distribuidora Andina", ruc: "20123456789"))
        contexto.insert(Producto(nombre: "Cemento 42.5 kg", categoria: "Construcción", stock: 40, costoPromedio: 110.0))
        try? contexto.save()
    }
}

