import SwiftUI

struct Paso5View: View {

    @Binding var datos: DatosCTS

    var resultado: ResultadoCTS {
        return CalculadoraCTS.calcular(datos)
    }

    var body: some View {
        VStack(spacing: 10) {

            // Faltas y licencia sin goce
            VStack(alignment: .leading, spacing: 8) {
                Toggle("¿Tuvo faltas injustificadas o licencia sin goce de haber?", isOn: $datos.tuvoFaltas)
                    .font(.subheadline)
                if datos.tuvoFaltas {
                    Text("Faltas injustificadas (días)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("0", text: $datos.faltas)
                        .keyboardType(.numberPad)
                        .campo()
                    Text("Licencia sin goce de haber (días)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("0", text: $datos.licenciaSinGoce)
                        .keyboardType(.numberPad)
                        .campo()
                }
            }
            .tarjeta()

            // Descanso médico
            VStack(alignment: .leading, spacing: 8) {
                Toggle("¿Tuvo descanso médico en el año?", isOn: $datos.tuvoDescansoMedico)
                    .font(.subheadline)
                if datos.tuvoDescansoMedico {
                    Text("Días de descanso médico del año")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("0", text: $datos.descansoMedico)
                        .keyboardType(.numberPad)
                        .campo()
                    Text("Solo restan los días que pasen de 60")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .tarjeta()

            Text("Las vacaciones y las licencias con goce de haber no se descuentan.")
                .font(.caption)
                .foregroundColor(.gray)

            // Resumen en vivo
            VStack(alignment: .leading, spacing: 4) {
                Text("Días que no se cuentan: \(resultado.diasNoComputables)")
                Text("Días computables: \(resultado.diasComputables)")
            }
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(12)

            if resultado.diasComputables < 30 {
                Text("Con menos de 30 días computables no corresponde CTS")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    Paso5View(datos: .constant(DatosCTS()))
}
