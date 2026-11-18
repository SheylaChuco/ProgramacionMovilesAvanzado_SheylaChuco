import SwiftUI
import SwiftData

// B1 · Login
struct LoginView: View {
    @Environment(Sesion.self) private var sesion
    @Query private var usuarios: [Usuario]

    @State private var usuario = ""
    @State private var clave = ""
    @State private var hayError = false
    @State private var verRegistro = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "cart.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(.blue)
                Text("Compras")
                    .font(.largeTitle.bold())

                TextField("Usuario", text: $usuario)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                SecureField("Clave", text: $clave)
                    .textFieldStyle(.roundedBorder)

                // Mensaje genérico: no dice si falló el usuario o la clave
                if hayError {
                    Text("Usuario o clave incorrectos")
                        .font(.footnote)
                        .foregroundStyle(.red)
                }

                Button("Ingresar") {
                    ingresar()
                }
                .buttonStyle(.borderedProminent)

                Button("Crear cuenta") {
                    verRegistro = true
                }
            }
            .padding(24)
            .navigationDestination(isPresented: $verRegistro) {
                RegistroView()
            }
        }
    }

    private func ingresar() {
        let nombre = usuario.recortado.lowercased()
        let encontrado = usuarios.first {
            $0.usuario.lowercased() == nombre && $0.clave == clave
        }
        if let encontrado {
            hayError = false
            sesion.usuario = encontrado
        } else {
            hayError = true
        }
    }
}

