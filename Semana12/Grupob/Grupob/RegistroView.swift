import SwiftUI
import SwiftData

// B2 · Registro
struct RegistroView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(Sesion.self) private var sesion
    @Query private var usuarios: [Usuario]

    @State private var nombre = ""
    @State private var usuario = ""
    @State private var clave = ""
    @State private var confirmacion = ""
    @State private var rol = "Comprador"

    // El usuario debe ser único, sin distinguir mayúsculas
    private var usuarioExiste: Bool {
        let buscado = usuario.recortado.lowercased()
        return usuarios.contains { $0.usuario.lowercased() == buscado }
    }

    private var claveCorta: Bool {
        !clave.isEmpty && clave.count < 6
    }

    private var noCoincide: Bool {
        !confirmacion.isEmpty && clave != confirmacion
    }

    private var formularioValido: Bool {
        !nombre.recortado.isEmpty
            && !usuario.recortado.isEmpty
            && !usuarioExiste
            && clave.count >= 6
            && clave == confirmacion
    }

    var body: some View {
        Form {
            Section("Datos personales") {
                TextField("Nombre completo", text: $nombre)
                TextField("Usuario", text: $usuario)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if usuarioExiste {
                    Text("Ese usuario ya existe")
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
            }

            Section("Clave") {
                SecureField("Clave (mínimo 6 caracteres)", text: $clave)
                SecureField("Confirmar clave", text: $confirmacion)
                if claveCorta {
                    Text("La clave debe tener al menos 6 caracteres")
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
                if noCoincide {
                    Text("Las claves no coinciden")
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
            }

            Section("Rol") {
                Picker("Rol", selection: $rol) {
                    Text("Comprador").tag("Comprador")
                    Text("Supervisor").tag("Supervisor")
                }
                .pickerStyle(.segmented)
            }

            Section {
                Button("Registrarme") {
                    registrar()
                }
                .disabled(!formularioValido)
            }
        }
        .navigationTitle("Crear cuenta")
    }

    private func registrar() {
        let nuevo = Usuario(nombre: nombre.recortado, usuario: usuario.recortado, clave: clave, rol: rol)
        contexto.insert(nuevo)
        try? contexto.save()
        // Al registrarse entra directo a la app
        sesion.usuario = nuevo
    }
}

