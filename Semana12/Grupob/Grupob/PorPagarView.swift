import SwiftUI
import SwiftData

// B8 · Por pagar (solo supervisor)
struct PorPagarView: View {
    @Environment(\.modelContext) private var contexto
    @Query(filter: #Predicate<Compra> { $0.alCredito == true && $0.estado == "Aprobada" },
           sort: \Compra.vence)
    private var credito: [Compra]

    @State private var filtro = FiltroPago.pendientes

    enum FiltroPago: String, CaseIterable, Identifiable {
        case pendientes = "Pendientes"
        case vencidas = "Vencidas"
        case pagadas = "Pagadas"

        var id: String { rawValue }
    }

    private var visibles: [Compra] {
        switch filtro {
        case .pendientes: return credito.filter { !$0.pagada }
        case .vencidas: return credito.filter { Reglas.estaVencida($0) }
        case .pagadas: return credito.filter { $0.pagada }
        }
    }

    private var totalPorPagar: Double {
        credito.filter { !$0.pagada }.reduce(0) { $0 + $1.total }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filtro", selection: $filtro) {
                    ForEach(FiltroPago.allCases) { opcion in
                        Text(opcion.rawValue).tag(opcion)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                if visibles.isEmpty {
                    ContentUnavailableView("Sin compras", systemImage: "tray")
                } else {
                    List(visibles) { compra in
                        FilaCompraView(compra: compra, mostrarComprador: true)
                            .swipeActions(edge: .trailing) {
                                if !compra.pagada {
                                    Button("Pagar") {
                                        pagar(compra)
                                    }
                                    .tint(.green)
                                }
                            }
                    }
                }
            }
            .navigationTitle("Por pagar")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    MenuCuenta()
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Text("Total por pagar")
                    Spacer()
                    Text(totalPorPagar.soles)
                }
                .font(.headline)
                .padding()
                .background(.thinMaterial)
            }
        }
    }

    // Pagar: marca la compra como pagada y sale de Pendientes
    private func pagar(_ compra: Compra) {
        compra.pagada = true
        try? contexto.save()
    }
}

