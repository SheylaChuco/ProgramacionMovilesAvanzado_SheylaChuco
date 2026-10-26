import SwiftUI

struct Paso3View: View {

    @Binding var datos: DatosCTS

    // Asignación familiar: 10% de la RMV
    var asignacion: Double {
        return CalculadoraCTS.redondear(CalculadoraCTS.rmv * CalculadoraCTS.porcentajeAsignacion)
    }

    // Qué gratificación corresponde según la CTS que se calcula
    var gratificacionDe: String {
        return datos.deposito == "Noviembre" ? "julio" : "diciembre"
    }

    var body: some View {
        VStack(spacing: 10) {

            // Sueldo básico
            VStack(alignment: .leading, spacing: 6) {
                Text("Sueldo básico mensual")
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack {
                    Text("S/")
                        .foregroundColor(.gray)
                    TextField("Ej. 2500", text: $datos.sueldo)
                        .keyboardType(.decimalPad)
                }
                .campo()
                Text("El del último mes del periodo")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .tarjeta()

            // Asignación familiar
            VStack(alignment: .leading, spacing: 8) {
                Toggle("¿Tiene hijos menores de 18 años (o hasta 24 si estudian)?", isOn: $datos.tieneHijos)
                    .font(.subheadline)
                if datos.tieneHijos {
                    Text("Asignación familiar: S/ \(String(format: "%.2f", asignacion))")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
            .tarjeta()

            // Última gratificación
            VStack(alignment: .leading, spacing: 6) {
                Text("Última gratificación recibida")
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack {
                    Text("S/")
                        .foregroundColor(.gray)
                    TextField("Ej. 2500", text: $datos.gratificacion)
                        .keyboardType(.decimalPad)
                }
                .campo()
                Text("La de \(gratificacionDe), sin el 9% extra. Si no recibió, déjala vacía")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .tarjeta()
        }
    }
}

#Preview {
    Paso3View(datos: .constant(DatosCTS()))
}
