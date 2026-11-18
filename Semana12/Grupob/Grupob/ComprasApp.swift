import SwiftUI
import SwiftData

@main
struct ComprasApp: App {
    @State private var sesion = Sesion()

    var body: some Scene {
        WindowGroup {
            RaizView()
                .environment(sesion)
        }
        // Contenedor de SwiftData con las 4 clases del modelo
        .modelContainer(for: [Usuario.self, Proveedor.self, Producto.self, Compra.self])
    }
}

