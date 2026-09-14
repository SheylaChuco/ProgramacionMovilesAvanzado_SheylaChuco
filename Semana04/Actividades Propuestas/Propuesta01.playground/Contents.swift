// ===== ACTIVIDAD PROPUESTA 01: FACTURACIÓN DE CURSOS =====
import Foundation

struct CursoInscrito {
    let nombre: String
    let cantidad: Int
    let precioUnitario: Double
}

struct Estudiante {
    let nombre: String
    let dni: String
    let esAlumnoTecsup: Bool
    var cursos: [CursoInscrito] = []
}

func formato(_ valor: Double) -> String {
    return String(format: "%.2f", valor)
}
