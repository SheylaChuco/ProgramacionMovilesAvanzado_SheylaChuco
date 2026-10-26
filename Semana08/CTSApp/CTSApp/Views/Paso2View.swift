import SwiftUI

struct Paso2View: View {

    @Binding var datos: DatosCTS

    // Se recalcula cada vez que cambian los datos
    var resultado: ResultadoCTS {
        return CalculadoraCTS.calcular(datos)
    }

    // Fecha en formato dd/MM/yyyy
    func texto(_ fecha: Date) -> String {
        let formato = DateFormatter()
        formato.dateFormat = "dd/MM/yyyy"
        return formato.string(from: fecha)
    }

    var body: some View {
        VStack(spacing: 10) {

            // ¿Trabajó todo el periodo?
            VStack(alignment: .leading, spacing: 6) {
                Text("Periodo de esta CTS: \(texto(resultado.inicioPeriodo)) al \(texto(resultado.finPeriodo))")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("¿Trabajó todo el periodo?")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Picker("¿Trabajó todo el periodo?", selection: $datos.trabajoTodoElPeriodo) {
                    Text("Sí").tag(true)
                    Text("No").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .tarjeta()

            // Solo si NO trabajó todo el periodo
            if !datos.trabajoTodoElPeriodo {

                // Fecha de ingreso
                VStack(alignment: .leading, spacing: 8) {
                    Toggle("¿Entró después del \(texto(resultado.inicioPeriodo))?", isOn: $datos.entroDespues)
                        .font(.subheadline)
                    if datos.entroDespues {
                        DatePicker("Fecha de ingreso", selection: $datos.fechaIngreso, displayedComponents: .date)
                            .font(.subheadline)
                    }
                }
                .tarjeta()

                // Fecha de cese
                VStack(alignment: .leading, spacing: 8) {
                    Toggle("¿Dejó la empresa antes del \(texto(resultado.finPeriodo))?", isOn: $datos.dejoLaEmpresa)
                        .font(.subheadline)
                    if datos.dejoLaEmpresa {
                        DatePicker("Fecha de cese", selection: $datos.fechaCese, displayedComponents: .date)
                            .font(.subheadline)
                    }
                }
                .tarjeta()

                if !datos.entroDespues && !datos.dejoLaEmpresa {
                    Text("Activa al menos una de las dos opciones")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            // Aviso en vivo
            if resultado.finComputo < resultado.inicioComputo {
                Text("Revisa las fechas: el trabajador no estuvo en este periodo")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            } else {
                Text("Se cuenta: \(resultado.mesesCompletos) meses y \(resultado.diasSueltos) días (\(resultado.diasPeriodo) días)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
            }
        }
    }
}

#Preview {
    Paso2View(datos: .constant(DatosCTS()))
}
