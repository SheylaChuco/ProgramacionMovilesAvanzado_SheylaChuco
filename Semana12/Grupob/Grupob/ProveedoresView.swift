import SwiftUI
import SwiftData

// B4 · Proveedores
struct ProveedoresView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(Sesion.self) private var sesion
    @Query(sort: \Proveedor.nombre) private var proveedores: [Proveedor]

    @State private var mostrarNuevo = false
    @State private var proveedorAEditar: Proveedor?
    @State private var mensaje = ""
    @State private var mostrarMensaje = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(proveedores) { proveedor in
                    Button {
                        if sesion.esSupervisor {
                            proveedorAEditar = proveedor
                        }
                    } label: {
                        FilaProveedor(proveedor: proveedor)
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .deleteDisabled(!sesion.esSupervisor)
                }
                .onDelete(perform: borrar)
            }
            .navigationTitle("Proveedores")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    if sesion.esSupervisor {
                        Button {
                            mostrarNuevo = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    MenuCuenta()
                }
            }
            .sheet(isPresented: $mostrarNuevo) {
                FormularioProveedorView(proveedor: nil)
            }
            .sheet(item: $proveedorAEditar) { proveedor in
                FormularioProveedorView(proveedor: proveedor)
            }
            .alert("No se puede borrar", isPresented: $mostrarMensaje) {
                Button("Entendido", role: .cancel) {}
            } message: {
                Text(mensaje)
            }
        }
    }

    // Un proveedor con compras no se borra (.deny)
    private func borrar(_ posiciones: IndexSet) {
        for posicion in posiciones {
            let proveedor = proveedores[posicion]
            if proveedor.compras.isEmpty {
                contexto.delete(proveedor)
            } else {
                mensaje = "\"\(proveedor.nombre)\" ya tiene compras registradas."
                mostrarMensaje = true
            }
        }
        try? contexto.save()
    }
}

struct FilaProveedor: View {
    let proveedor: Proveedor

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(proveedor.nombre)
                    .font(.headline)
                Text("RUC \(proveedor.ruc)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("Total comprado: \(proveedor.totalComprado.soles)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if proveedor.totalPorPagar > 0 {
                etiqueta("Por pagar \(proveedor.totalPorPagar.soles)", .orange)
            } else {
                etiqueta("Al día", .green)
            }
        }
    }

    private func etiqueta(_ texto: String, _ color: Color) -> some View {
        Text(texto)
            .font(.caption.bold())
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.18))
            .foregroundStyle(color)
            .clipShape(Capsule())
    }
}

struct FormularioProveedorView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(\.dismiss) private var dismiss

    let proveedor: Proveedor?
    @State private var nombre: String
    @State private var ruc: String

    init(proveedor: Proveedor?) {
        self.proveedor = proveedor
        _nombre = State(initialValue: proveedor?.nombre ?? "")
        _ruc = State(initialValue: proveedor?.ruc ?? "")
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nombre", text: $nombre)
                TextField("RUC", text: $ruc)
                    .keyboardType(.numberPad)
            }
            .navigationTitle(proveedor == nil ? "Nuevo proveedor" : "Editar proveedor")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") { guardar() }
                        .disabled(nombre.recortado.isEmpty)
                }
            }
        }
    }

    private func guardar() {
        if let proveedor {
            proveedor.nombre = nombre.recortado
            proveedor.ruc = ruc.recortado
        } else {
            contexto.insert(Proveedor(nombre: nombre.recortado, ruc: ruc.recortado))
        }
        try? contexto.save()
        dismiss()
    }
}

