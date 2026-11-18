import Foundation
import Observation

// Guarda el usuario conectado mientras la app está abierta.
// Si usuario es nil, la app muestra el login; si tiene valor, muestra las pestañas.
@Observable
class Sesion {
    var usuario: Usuario?

    var esSupervisor: Bool {
        usuario?.rol == "Supervisor"
    }
}

