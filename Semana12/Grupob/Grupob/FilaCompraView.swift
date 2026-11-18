import SwiftUI

// Fila de una compra, la usan Mis compras, Aprobar y Por pagar
struct FilaCompraView: View {
    let compra: Compra
    var mostrarComprador = false

    private var colorEstado: Color {
        switch compra.estado {
        case "Aprobada": return .green
        case "Rechazada": return .red
        default: return .orange
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(compra.producto?.nombre ?? "Producto")
                    .font(.headline)
                Spacer()
                Text(compra.total.soles)
                    .font(.headline)
            }

            Text("\(compra.proveedor?.nombre ?? "Proveedor") · \(compra.cantidad) × \(compra.costoUnitario.soles)")
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(compra.fecha.formatted(date: .abbreviated, time: .omitted))
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: 6) {
                etiqueta(compra.estado, colorEstado)
                if compra.alCredito {
                    etiqueta(compra.pagada ? "Pagada" : "Crédito", .blue)
                }
                if Reglas.estaVencida(compra) {
                    etiqueta("VENCIDA", .red)
                }
            }

            if compra.alCredito {
                Text("Vence: \(compra.vence.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            if mostrarComprador, let comprador = compra.comprador {
                Text("Solicitó: \(comprador.nombre)")
                    .font(.caption)
            }

            if compra.estado == "Rechazada", let motivo = compra.motivoRechazo {
                Text("Motivo: \(motivo)")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
    }

    private func etiqueta(_ texto: String, _ color: Color) -> some View {
        Text(texto)
            .font(.caption2.bold())
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(color.opacity(0.18))
            .foregroundStyle(color)
            .clipShape(Capsule())
    }
}

