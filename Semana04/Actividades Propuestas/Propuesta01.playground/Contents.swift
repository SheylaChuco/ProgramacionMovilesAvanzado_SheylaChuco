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
func generarFactura(estudiante: Estudiante) {
    var totalCursos = 0
    for curso in estudiante.cursos {
        totalCursos += curso.cantidad
    }

    var subtotal = 0.0
    for curso in estudiante.cursos {
        subtotal += curso.precioUnitario * Double(curso.cantidad)
    }

    let igv = subtotal * 0.18
    let totalConIGV = subtotal + igv

    var descuentoCantidad = 0.0
    if totalCursos >= 3 {
        descuentoCantidad = totalConIGV * 0.10
    }

    var descuentoTecsup = 0.0
    if estudiante.esAlumnoTecsup && totalCursos >= 3 {
        descuentoTecsup = 400.0
    }

    let totalFinal = totalConIGV - descuentoCantidad - descuentoTecsup

    print("FACTURA DE CURSOS")
    print("Estudiante: \(estudiante.nombre)")
    print("DNI: \(estudiante.dni)")
    print("Alumno de Tecsup: \(estudiante.esAlumnoTecsup ? "Sí" : "No")")
    print("------------------------")
    for curso in estudiante.cursos {
        let totalLinea = curso.precioUnitario * Double(curso.cantidad)
        print("\(curso.nombre) x\(curso.cantidad) - S/ \(formato(totalLinea))")
    }
    print("------------------------")
    print("Subtotal: S/ \(formato(subtotal))")
    print("IGV (18%): S/ \(formato(igv))")
    print("Total con IGV: S/ \(formato(totalConIGV))")
    if descuentoCantidad > 0 {
        print("Descuento 10% por cantidad: -S/ \(formato(descuentoCantidad))")
    }
    if descuentoTecsup > 0 {
        print("Descuento especial Tecsup: -S/ \(formato(descuentoTecsup))")
    }
    print("------------------------")
    print("TOTAL FINAL A PAGAR: S/ \(formato(totalFinal))")
}
