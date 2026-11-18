import SwiftUI

// Las pestañas cambian según el rol
struct PrincipalView: View {
    @Environment(Sesion.self) private var sesion

    var body: some View {
        if sesion.esSupervisor {
            TabView {
                ResumenView()
                    .tabItem { Label("Resumen", systemImage: "chart.bar.fill") }
                AprobarView()
                    .tabItem { Label("Aprobar", systemImage: "checkmark.seal.fill") }
                PorPagarView()
                    .tabItem { Label("Por pagar", systemImage: "creditcard.fill") }
                ProductosView()
                    .tabItem { Label("Productos", systemImage: "shippingbox.fill") }
                ProveedoresView()
                    .tabItem { Label("Proveedores", systemImage: "building.2.fill") }
            }
        } else {
            TabView {
                ProductosView()
                    .tabItem { Label("Productos", systemImage: "shippingbox.fill") }
                ProveedoresView()
                    .tabItem { Label("Proveedores", systemImage: "building.2.fill") }
                NuevaCompraView()
                    .tabItem { Label("Compra", systemImage: "cart.badge.plus") }
                MisComprasView()
                    .tabItem { Label("Mis compras", systemImage: "list.bullet.rectangle") }
            }
        }
    }
}

