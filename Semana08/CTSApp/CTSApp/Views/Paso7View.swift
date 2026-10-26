import SwiftUI

struct Paso7View: View {

    let datos: DatosCTS

    var resultado: ResultadoCTS {
        return CalculadoraCTS.calcular(datos)
    }

    func texto(_ fecha: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "dd/MM/yyyy"
        return f.string(from: fecha)
    }

    func soles(_ valor: Double) -> String {
        return String(format: "S/ %.2f", valor)
    }

    func fila(_ titulo: String, _ valor: String) -> some View {
        HStack {
            Text(titulo)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            Text(valor)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }

    var body: some View {
        VStack(spacing: 10) {

            // Monto o motivo
            VStack(spacing: 6) {
                if resultado.tieneDerecho {
                    Text("Tu CTS es")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(soles(resultado.cts))
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.green)
                    Text("Sí tiene derecho a CTS")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                } else {
                    Text("No corresponde CTS")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                    Text(resultado.motivo)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8)
            .tarjeta()

            // Periodo
            VStack(alignment: .leading, spacing: 8) {
                Text("PERIODO")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                fila("Trabajador", datos.nombre)
                fila("Depósito", "\(datos.deposito) \(datos.anio)")
                fila("Periodo", "\(texto(resultado.inicioPeriodo)) al \(texto(resultado.finPeriodo))")
                fila("Se cuenta", "\(resultado.mesesCompletos) meses y \(resultado.diasSueltos) días")
                fila("Días computables", "\(resultado.diasComputables)")
            }
            .tarjeta()

            // Detalle
            VStack(alignment: .leading, spacing: 8) {
                Text("REMUNERACIÓN COMPUTABLE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                fila("Sueldo", soles(resultado.sueldo))
                fila("Asignación familiar", soles(resultado.asignacionFamiliar))
                fila("1/6 de gratificación", soles(resultado.sextoGratificacion))
                fila("Promedio horas extras", soles(resultado.promedioHorasExtras))
                fila("Promedio comisiones", soles(resultado.promedioComisiones))
                Divider()
                fila("Total", soles(resultado.remuneracionComputable))
            }
            .tarjeta()

            // Fórmula
            VStack(alignment: .leading, spacing: 6) {
                Text("FÓRMULA")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Text("CTS = Remuneración computable ÷ 360 × días computables")
                    .font(.footnote)
                Text("\(soles(resultado.remuneracionComputable)) ÷ 360 × \(resultado.diasComputables)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .tarjeta()
        }
    }
}

#Preview {
    Paso7View(datos: DatosCTS())
}
