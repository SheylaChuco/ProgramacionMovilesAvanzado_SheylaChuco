import SwiftUI

// Avatar de la sesión con el menú para cerrar sesión
struct MenuCuenta: View {
    @Environment(Sesion.self) private var sesion

    var body: some View {
        Menu {
            if let usuario = sesion.usuario {
                Text("\(usuario.nombre) · \(usuario.rol)")
            }
            Button("Cerrar sesión", role: .destructive) {
                sesion.usuario = nil
            }
        } label: {
            Image(systemName: "person.crop.circle.fill")
                .font(.title2)
        }
    }
}

