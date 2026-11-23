import SwiftUI

struct UserFormView: View {
    @Environment(\.dismiss) var dismiss

    @State var name: String
    @State var email: String
    var isEditing: Bool
    var onSubmit: (String, String) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Datos del usuario")) {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.indigo)
                        TextField("Nombre", text: $name)
                    }
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.indigo)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                    }
                }

                Section {
                    Button {
                        onSubmit(name, email)
                        dismiss()
                    } label: {
                        Text(isEditing ? "Guardar cambios" : "Crear usuario")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                    .disabled(name.isEmpty || email.isEmpty)
                }
            }
            .navigationTitle(isEditing ? "Editar Usuario" : "Nuevo Usuario")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
        .tint(.indigo)
    }
}
