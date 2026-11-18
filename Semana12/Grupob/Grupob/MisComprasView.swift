import SwiftUI
import SwiftData

// B6 · Mis compras
struct MisComprasView: View {
    @Environment(Sesion.self) private var sesion
    @Query(sort: \Compra.fecha, order: .reverse) private var compras: [Compra]
    @State private var filtro = FiltroCompras.todas

    enum FiltroCompras: String, CaseIterable, Identifiable {
        case todas = "Todas"
        case pendientes = "Pendientes"
        case rechazadas = "Rechazadas"

        var id: String { rawValue }
    }

    // El comprador solo ve las compras que registró él
    private var misCompras: [Compra] {
        let propias = compras.filter { $0.comprador?.id == sesion.usuario?.id }
        switch filtro {
        case .todas: return propias
        case .pendientes: return propias.filter { $0.estado == "Pendiente" }
        case .rechazadas: return propias.filter { $0.estado == "Rechazada" }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filtro", selection: $filtro) {
                    ForEach(FiltroCompras.allCases) { opcion in
                        Text(opcion.rawValue).tag(opcion)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                if misCompras.isEmpty {
                    ContentUnavailableView("Sin compras", systemImage: "tray")
                } else {
                    List(misCompras) { compra in
                        FilaCompraView(compra: compra)
                    }
                }
            }
            .navigationTitle("Mis compras")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    MenuCuenta()
                }
            }
        }
    }
}

