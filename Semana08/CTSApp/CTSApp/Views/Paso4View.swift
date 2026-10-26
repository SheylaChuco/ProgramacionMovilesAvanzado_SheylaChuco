import SwiftUI

struct Paso4View: View {

    @Binding var datos: DatosCTS

    // 3 columnas para los 6 meses
    let columnas = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)

    var resultado: ResultadoCTS {
        return CalculadoraCTS.calcular(datos)
    }

    // Nombre del mes, empezando por el inicio del periodo (ej. May-26)
    func nombreMes(_ indice: Int) -> String {
        let nombres: [String] = "Ene Feb Mar Abr May Jun Jul Ago Set Oct Nov Dic".components(separatedBy: " ")
        let inicio = resultado.inicioPeriodo
        let fecha = Calendar.current.date(byAdding: .month, value: indice, to: inicio) ?? inicio
        let mes = Calendar.current.component(.month, from: fecha)
        let anio = Calendar.current.component(.year, from: fecha) % 100
        return "\(nombres[mes - 1])-\(anio)"
    }

    // Cuántos meses tienen algún pago
    func mesesConPago(_ montos: [String]) -> Int {
        return montos.filter { CalculadoraCTS.numero($0) > 0 }.count
    }

    // Tabla de 6 meses
    func tablaMeses(_ montos: Binding<[String]>) -> some View {
        LazyVGrid(columns: columnas, spacing: 8) {
            ForEach(0..<6, id: \.self) { i in
                VStack(alignment: .leading, spacing: 2) {
                    Text(nombreMes(i))
                        .font(.caption2)
                        .foregroundColor(.gray)
                    TextField("0", text: montos[i])
                        .keyboardType(.decimalPad)
                        .campo()
                }
            }
        }
    }

    // Mensaje que dice si el pago cuenta o no
    func aviso(_ montos: [String], _ promedio: Double) -> some View {
        let cantidad = mesesConPago(montos)
        let cuenta = cantidad >= 3
        let promedioTexto = String(format: "%.2f", promedio)
        var mensaje = "No cuenta: hubo pagos en \(cantidad) meses (se necesitan 3 o más)"
        if cuenta {
            mensaje = "Cuenta: promedio S/ \(promedioTexto)"
        }
        return Text(mensaje)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(cuenta ? .green : .gray)
    }

    var body: some View {
        VStack(spacing: 10) {

            // Horas extras
            VStack(alignment: .leading, spacing: 8) {
                Toggle("¿Tuvo horas extras?", isOn: $datos.tuvoHorasExtras)
                    .font(.subheadline)
                if datos.tuvoHorasExtras {
                    Text("Monto de cada mes (0 si no hubo)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    tablaMeses($datos.horasExtras)
                    aviso(datos.horasExtras, resultado.promedioHorasExtras)
                }
            }
            .tarjeta()

            // Comisiones
            VStack(alignment: .leading, spacing: 8) {
                Toggle("¿Tuvo comisiones?", isOn: $datos.tuvoComisiones)
                    .font(.subheadline)
                if datos.tuvoComisiones {
                    Text("Monto de cada mes (0 si no hubo)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    tablaMeses($datos.comisiones)
                    aviso(datos.comisiones, resultado.promedioComisiones)
                }
            }
            .tarjeta()
        }
    }
}

#Preview {
    Paso4View(datos: .constant(DatosCTS()))
}
