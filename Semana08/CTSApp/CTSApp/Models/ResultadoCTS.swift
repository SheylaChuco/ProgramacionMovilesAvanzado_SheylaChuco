import Foundation

// Resultado del cálculo (lo que se muestra al final)
struct ResultadoCTS {
    var tieneDerecho: Bool
    var motivo: String              // por qué no tiene derecho (si aplica)

    var inicioPeriodo: Date
    var finPeriodo: Date
    var inicioComputo: Date
    var finComputo: Date

    var mesesCompletos: Int
    var diasSueltos: Int
    var diasPeriodo: Int
    var diasNoComputables: Int
    var diasComputables: Int

    var sueldo: Double
    var asignacionFamiliar: Double
    var sextoGratificacion: Double
    var promedioHorasExtras: Double
    var promedioComisiones: Double
    var remuneracionComputable: Double

    var cts: Double
}
