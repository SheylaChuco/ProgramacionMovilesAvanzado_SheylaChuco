import Foundation

// Datos que ingresa el usuario en los 5 pasos
struct DatosCTS {

    // Paso 1: trabajador y periodo
    var nombre: String = ""
    var deposito: String = "Noviembre"   // "Mayo" o "Noviembre"
    var anio: Int = 2026
    var horasDiarias: String = ""

    // Paso 2: tiempo trabajado
    var trabajoTodoElPeriodo: Bool = true
    var entroDespues: Bool = false
    var fechaIngreso: Date = Date()
    var dejoLaEmpresa: Bool = false
    var fechaCese: Date = Date()

    // Paso 3: sueldo
    var sueldo: String = ""
    var tieneHijos: Bool = false
    var gratificacion: String = ""

    // Paso 4: pagos variables (6 meses cada uno)
    var tuvoHorasExtras: Bool = false
    var horasExtras: [String] = Array(repeating: "", count: 6)
    var tuvoComisiones: Bool = false
    var comisiones: [String] = Array(repeating: "", count: 6)

    // Paso 5: días que no cuentan
    var tuvoFaltas: Bool = false
    var faltas: String = ""
    var licenciaSinGoce: String = ""
    var tuvoDescansoMedico: Bool = false
    var descansoMedico: String = ""
}

