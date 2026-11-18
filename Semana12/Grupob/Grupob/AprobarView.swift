import SwiftUI
import SwiftData

// B7 · Aprobar (solo supervisor)
struct AprobarView: View {
    @Environment(\.modelContext) private var contexto
    @Query(filter: #Predicate<Compra> { $0.estado == "Pendiente" },
           sort: \Compra.fecha, order: .reverse)
    private var pendientes: [Compra]

    @State private var compraARechazar: Compra?

    var body: some View {
        NavigationStack {
            Group {
                if pendientes.isEmpty {
                    ContentUnavailableView("No hay compras por aprobar", systemImage: "checkmark.seal")
                } else {
                    List {
                        ForEach(pendientes) { compra in
                            Section {
                                tarjeta(compra)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Aprobar")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    MenuCuenta()
                }
            }
            .sheet(item: $compraARechazar) { compra in
                MotivoRechazoView(compra: compra)
            }
        }
    }

    @ViewBuilder
    private func tarjeta(_ compra: Compra) -> some View {
        FilaCompraView(compra: compra, mostrarComprador: true)

        // Vista previa del efecto: stock y costo promedio antes y después
        if let producto = compra.producto {
            VStack(alignment: .leading, spacing: 4) {
                Text("Efecto al aprobar")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("Stock: \(producto.stock) → \(producto.stock + compra.cantidad)")
                Text("Costo promedio: \(producto.costoPromedio.soles) → \(nuevoCosto(compra, producto).soles)")
            }
            .font(.subheadline)
        }

        HStack {
            Button("Rechazar", role: .destructive) {
                compraARechazar = compra
            }
            .buttonStyle(.bordered)
            Spacer()
            Button("Aprobar") {
                aprobar(compra)
            }
            .buttonStyle(.borderedProminent)
        }
    }

    private func nuevoCosto(_ compra: Compra, _ producto: Producto) -> Double {
        Reglas.nuevoCostoPromedio(
            stock: producto.stock,
            costoPromedio: producto.costoPromedio,
            cantidad: compra.cantidad,
            costoUnitario: compra.costoUnitario
        )
    }

    // Al aprobar se aplican los efectos: costo promedio y stock
    private func aprobar(_ compra: Compra) {
        compra.estado = "Aprobada"
        Reglas.aplicarEfectos(de: compra)
        try? contexto.save()
    }
}

// Rechazar pide un motivo obligatorio y no cambia nada del producto
struct MotivoRechazoView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(\.dismiss) private var dismiss

    let compra: Compra
    @State private var motivo = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Motivo del rechazo") {
                    TextField("Escribe el motivo", text: $motivo, axis: .vertical)
                        .lineLimit(3...5)
                }
                Section {
                    Text("Al rechazar no cambia el stock ni el costo promedio.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Rechazar compra")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Rechazar") { rechazar() }
                        .disabled(motivo.recortado.isEmpty)
                }
            }
        }
    }

    private func rechazar() {
        compra.estado = "Rechazada"
        compra.motivoRechazo = motivo.recortado
        try? contexto.save()
        dismiss()
    }
}

