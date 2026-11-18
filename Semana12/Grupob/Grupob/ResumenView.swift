import SwiftUI
import SwiftData

// B9 · Resumen del supervisor
struct ResumenView: View {
    @Environment(Sesion.self) private var sesion
    @Query private var productos: [Producto]
    @Query private var compras: [Compra]
    @Query(sort: \Proveedor.nombre) private var proveedores: [Proveedor]

    private var aprobadas: [Compra] {
        compras.filter { $0.estado == "Aprobada" }
    }

    private var pendientes: [Compra] {
        compras.filter { $0.estado == "Pendiente" }
    }

    private var valorInventario: Double {
        productos.reduce(0) { $0 + Double($1.stock) * $1.costoPromedio }
    }

    // Crédito fiscal = IGV de las compras aprobadas
    private var creditoFiscal: Double {
        aprobadas.reduce(0) { $0 + $1.igv }
    }

    private var porPagar: Double {
        aprobadas.filter { !$0.pagada }.reduce(0) { $0 + $1.total }
    }

    private var importePendiente: Double {
        pendientes.reduce(0) { $0 + $1.total }
    }

    private var mayorTotal: Double {
        proveedores.map { $0.totalComprado }.max() ?? 0
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Hola, \(sesion.usuario?.nombre ?? "") · Supervisor")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        IndicadorView(titulo: "Valor del inventario", valor: valorInventario.soles, detalle: "stock × costo promedio")
                        IndicadorView(titulo: "Crédito fiscal (IGV)", valor: creditoFiscal.soles, detalle: "compras aprobadas")
                        IndicadorView(titulo: "Por pagar", valor: porPagar.soles, detalle: "compras al crédito")
                        IndicadorView(titulo: "Por aprobar", valor: "\(pendientes.count) compras", detalle: importePendiente.soles)
                    }

                    Text("Total comprado por proveedor")
                        .font(.headline)

                    ForEach(proveedores) { proveedor in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(proveedor.nombre)
                                Spacer()
                                Text(proveedor.totalComprado.soles)
                                    .bold()
                            }
                            .font(.subheadline)

                            GeometryReader { medida in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(Color.gray.opacity(0.2))
                                    Capsule()
                                        .fill(Color.blue)
                                        .frame(width: medida.size.width * proporcion(proveedor))
                                }
                            }
                            .frame(height: 8)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Resumen")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    MenuCuenta()
                }
            }
        }
    }

    private func proporcion(_ proveedor: Proveedor) -> Double {
        guard mayorTotal > 0 else { return 0 }
        return proveedor.totalComprado / mayorTotal
    }
}

struct IndicadorView: View {
    let titulo: String
    let valor: String
    let detalle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(titulo)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(valor)
                .font(.title3.bold())
            Text(detalle)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

