import SwiftUI

struct Paso1View: View {

    // Los datos vienen de ContentView y se pueden modificar aquí
    @Binding var datos: DatosCTS

    let opciones = ["Mayo", "Noviembre"]

    var body: some View {
        VStack(spacing: 10) {

            // Nombre
            VStack(alignment: .leading, spacing: 6) {
                Text("Nombre del trabajador")
                    .font(.caption)
                    .foregroundColor(.gray)
                TextField("Ej. Juan Pérez", text: $datos.nombre)
                    .campo()
            }
            .tarjeta()

            // CTS de mayo o noviembre
            VStack(alignment: .leading, spacing: 6) {
                Text("CTS de")
                    .font(.caption)
                    .foregroundColor(.gray)
                Picker("CTS de", selection: $datos.deposito) {
                    ForEach(opciones, id: \.self) { opcion in
                        Text(opcion)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .tarjeta()

            // Año
            VStack(alignment: .leading, spacing: 6) {
                Text("Año")
                    .font(.caption)
                    .foregroundColor(.gray)
                Stepper("\(datos.anio)", value: $datos.anio, in: 2020...2100)
            }
            .tarjeta()

            // Horas de trabajo al día
            VStack(alignment: .leading, spacing: 6) {
                Text("Horas de trabajo al día")
                    .font(.caption)
                    .foregroundColor(.gray)
                TextField("Ej. 8", text: $datos.horasDiarias)
                    .keyboardType(.decimalPad)
                    .campo()

                if !datos.horasDiarias.isEmpty && CalculadoraCTS.numero(datos.horasDiarias) < 4 {
                    Text("Con menos de 4 horas diarias no corresponde CTS")
                        .font(.caption)
                        .foregroundColor(.red)
                } else {
                    Text("Si son menos de 4 horas, no corresponde CTS")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .tarjeta()
        }
    }
}

#Preview {
    Paso1View(datos: .constant(DatosCTS()))
}
