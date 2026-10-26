import SwiftUI

struct Paso6View: View {

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

    // Una fila: título a la izquierda, valor a la derecha
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

    // Un bloque con título y filas
    func bloque(_ titulo: String, _ filas: [AnyView]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(titulo)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            ForEach(0..<filas.count, id: \.self) { i in
                filas[i]
            }
        }
        .tarjeta()
    }

    var body: some View {
        VStack(spacing: 10) {

            // Trabajador y periodo
            VStack(alignment: .leading, spacing: 8) {
                Text("TRABAJADOR Y PERIODO")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                fila("Nombre", datos.nombre)
                fila("Depósito", "\(datos.deposito) \(datos.anio)")
                fila("Horas diarias", datos.horasDiarias)
            }
            .tarjeta()

            // Tiempo trabajado
            VStack(alignment: .leading, spacing: 8) {
                Text("TIEMPO TRABAJADO")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                fila("Desde", texto(resultado.inicioComputo))
                fila("Hasta", texto(resultado.finComputo))
                fila("Se cuenta", "\(resultado.mesesCompletos) meses y \(resultado.diasSueltos) días")
            }
            .tarjeta()

            // Sueldo
            VStack(alignment: .leading, spacing: 8) {
                Text("SUELDO")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                fila("Sueldo", soles(resultado.sueldo))
                fila("Asignación familiar", soles(resultado.asignacionFamiliar))
                fila("1/6 de gratificación", soles(resultado.sextoGratificacion))
            }
            .tarjeta()

            // Pagos variables
            VStack(alignment: .leading, spacing: 8) {
                Text("PAGOS VARIABLES")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                fila("Promedio horas extras", soles(resultado.promedioHorasExtras))
                fila("Promedio comisiones", soles(resultado.promedioComisiones))
            }
            .tarjeta()

            // Días
            VStack(alignment: .leading, spacing: 8) {
                Text("DÍAS")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                fila("Días que no cuentan", "\(resultado.diasNoComputables)")
                fila("Días computables", "\(resultado.diasComputables)")
            }
            .tarjeta()

            Text("Si algo está mal, vuelve con Atrás y corrígelo.")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    Paso6View(datos: DatosCTS())
}
