import Foundation
import SwiftData

@Model
class Usuario {
    var nombre: String
    var usuario: String
    var clave: String
    var rol: String   // "Comprador" o "Supervisor"

    // Un usuario tiene muchas compras. .deny: no se puede borrar si tiene compras
    @Relationship(deleteRule: .deny, inverse: \Compra.comprador)
    var compras: [Compra] = []

    init(nombre: String, usuario: String, clave: String, rol: String) {
        self.nombre = nombre
        self.usuario = usuario
        self.clave = clave
        self.rol = rol
    }
}

