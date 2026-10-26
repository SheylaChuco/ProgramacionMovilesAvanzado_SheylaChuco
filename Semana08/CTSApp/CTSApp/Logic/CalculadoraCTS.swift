import Foundation

// Crea una fecha con año, mes y día
func crearFecha(_ anio: Int, _ mes: Int, _ dia: Int) -> Date {
    let componentes = DateComponents(year: anio, month: mes, day: dia)
    return Calendar.current.date(from: componentes) ?? Date()
}

struct CalculadoraCTS {

    static let rmv = 1230.0                 // D.S. 015-2026-TR
    static let porcentajeAsignacion = 0.10  // Ley 25129

    // Convierte el texto en número (acepta coma o punto)
    static func numero(_ texto: String) -> Double {
        let limpio = texto.replacingOccurrences(of: ",", with: ".")
        return Double(limpio) ?? 0
    }

    // Redondea a 2 decimales 
    static func redondear(_ valor: Double) -> Double {
        return (valor * 100 + 0.000001).rounded() / 100
    }

    // Promedio de horas extras o comisiones:
    // solo cuenta si hubo en 3 meses o más
    static func promedio(_ montos: [String], mesesTrabajados: Int) -> Double {
        let valores = montos.map { numero($0) }
        let mesesConPago = valores.filter { $0 > 0 }.count
        if mesesConPago < 3 {
            return 0
        }
        let divisor = Double(max(1, min(6, mesesTrabajados)))
        return redondear(valores.reduce(0, +) / divisor)
    }

    static func calcular(_ d: DatosCTS) -> ResultadoCTS {
        let calendario = Calendar.current

        // 1. Periodo de la CTS
        let inicioPeriodo: Date
        let finPeriodo: Date
        if d.deposito == "Noviembre" {
            inicioPeriodo = crearFecha(d.anio, 5, 1)
            finPeriodo = crearFecha(d.anio, 10, 31)
        } else {
            inicioPeriodo = crearFecha(d.anio - 1, 11, 1)
            finPeriodo = crearFecha(d.anio, 4, 30)
        }

        // 2. Desde y hasta cuándo se cuenta
        var inicioComputo = inicioPeriodo
        var finComputo = finPeriodo
        if !d.trabajoTodoElPeriodo {
            if d.entroDespues {
                let ingreso = calendario.startOfDay(for: d.fechaIngreso)
                if ingreso > inicioPeriodo { inicioComputo = ingreso }
            }
            if d.dejoLaEmpresa {
                let cese = calendario.startOfDay(for: d.fechaCese)
                if cese < finPeriodo { finComputo = cese }
            }
        }

        // 3. Meses completos y días sueltos
        var meses = 0
        var diasSueltos = 0
        if finComputo >= inicioComputo {
            let finMasUno = calendario.date(byAdding: .day, value: 1, to: finComputo) ?? finComputo
            let diferencia = calendario.dateComponents([.month, .day], from: inicioComputo, to: finMasUno)
            meses = diferencia.month ?? 0
            diasSueltos = diferencia.day ?? 0
        }
        let diasPeriodo = min(180, meses * 30 + diasSueltos)

        // 4. Días que no cuentan
        let faltas = d.tuvoFaltas ? Int(numero(d.faltas)) : 0
        let licencia = d.tuvoFaltas ? Int(numero(d.licenciaSinGoce)) : 0
        let medico = d.tuvoDescansoMedico ? Int(numero(d.descansoMedico)) : 0
        let diasNoComputables = faltas + licencia + max(0, medico - 60)
        let diasComputables = max(0, diasPeriodo - diasNoComputables)

        // 5. ¿Tiene derecho a CTS?
        var tieneDerecho = true
        var motivo = ""
        if numero(d.horasDiarias) < 4 {
            tieneDerecho = false
            motivo = "Trabaja menos de 4 horas diarias."
        } else if diasComputables < 30 {
            tieneDerecho = false
            motivo = "Tiene menos de 30 días computables."
        }

        // 6. Remuneración computable
        let sueldo = numero(d.sueldo)
        let asignacion = d.tieneHijos ? redondear(rmv * porcentajeAsignacion) : 0
        let sexto = redondear(numero(d.gratificacion) / 6)
        let promHorasExtras = d.tuvoHorasExtras ? promedio(d.horasExtras, mesesTrabajados: meses) : 0
        let promComisiones = d.tuvoComisiones ? promedio(d.comisiones, mesesTrabajados: meses) : 0
        let rc = sueldo + asignacion + sexto + promHorasExtras + promComisiones

        // 7. CTS = RC / 360 x días computables
        let cts = tieneDerecho ? redondear(rc / 360 * Double(diasComputables)) : 0

        return ResultadoCTS(
            tieneDerecho: tieneDerecho,
            motivo: motivo,
            inicioPeriodo: inicioPeriodo,
            finPeriodo: finPeriodo,
            inicioComputo: inicioComputo,
            finComputo: finComputo,
            mesesCompletos: meses,
            diasSueltos: diasSueltos,
            diasPeriodo: diasPeriodo,
            diasNoComputables: diasNoComputables,
            diasComputables: diasComputables,
            sueldo: sueldo,
            asignacionFamiliar: asignacion,
            sextoGratificacion: sexto,
            promedioHorasExtras: promHorasExtras,
            promedioComisiones: promComisiones,
            remuneracionComputable: rc,
            cts: cts
        )
    }
}
