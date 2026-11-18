import SwiftUI
import SwiftData

// Pantalla inicial: login si no hay sesión, pestañas si hay un usuario conectado
struct RaizView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(Sesion.self) private var sesion

    var body: some View {
        Group {
            if sesion.usuario != nil {
                PrincipalView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            Datos.sembrarSiVacio(contexto)
        }
    }
}

