import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()

    @State private var showingForm = false
    @State private var editingUser: User? = nil

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {

                // Fondo con degradado
                LinearGradient(
                    colors: [Color.indigo.opacity(0.18), Color.teal.opacity(0.18)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 0) {

                    // Buscador
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Buscar usuario por nombre", text: $viewModel.searchText)
                    }
                    .padding(12)
                    .background(Color(.systemBackground))
                    .cornerRadius(14)
                    .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                    // Lista en forma de tarjetas
                    List(viewModel.filteredUsers) { user in
                        HStack(spacing: 14) {
                            ZStack {
                                Circle()
                                    .fill(LinearGradient(
                                        colors: [.indigo, .teal],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 46, height: 46)
                                Text(String(user.name.prefix(1)))
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                            }

                            VStack(alignment: .leading, spacing: 3) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                        .padding(12)
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .swipeActions {
                            Button(role: .destructive) {
                                Task {
                                    await viewModel.deleteUser(id: user.id)
                                }
                            } label: {
                                Label("Eliminar", systemImage: "trash")
                            }

                            Button {
                                editingUser = user
                                showingForm = true
                            } label: {
                                Label("Editar", systemImage: "pencil")
                            }.tint(.indigo)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }

                // Botón flotante para agregar
                Button {
                    editingUser = nil
                    showingForm = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(
                            LinearGradient(
                                colors: [.indigo, .teal],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.25), radius: 6, y: 3)
                }
                .padding(24)
            }
            .navigationTitle("Usuarios")
            .onAppear {
                Task {
                    await viewModel.fetchUsers()
                }
            }
            .sheet(isPresented: $showingForm) {
                if let user = editingUser {
                    UserFormView(name: user.name, email: user.email, isEditing: true) { name, email in
                        let updated = User(id: user.id, name: name, email: email)
                        Task {
                            await viewModel.updateUser(user: updated)
                        }
                    }
                } else {
                    UserFormView(name: "", email: "", isEditing: false) { name, email in
                        Task {
                            await viewModel.createUser(name: name, email: email)
                        }
                    }
                }
            }
        }
        .tint(.indigo)
    }
}

#Preview {
    ContentView()
}
