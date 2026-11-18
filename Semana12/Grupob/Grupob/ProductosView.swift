import SwiftUI
import SwiftData

// B3 · Productos
struct ProductosView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(Sesion.self) private var sesion
    @Query(sort: \Producto.nombre) private var productos: [Producto]

    @State private var busqueda = ""
    @State private var mostrarNuevo = false
    @State private var productoAEditar: Producto?
    @State private var mensaje = ""
    @State private var mostrarMensaje = false

    private var filtrados: [Producto] {
        let texto = busqueda.recortado
        guard !texto.isEmpty else { return productos }
        return productos.filter {
            $0.nombre.localizedCaseInsensitiveContains(texto)
                || $0.categoria.localizedCaseInsensitiveContains(texto)
        }
    }

    // Valor del inventario = suma de stock x costo promedio
    private var valorInventario: Double {
        productos.reduce(0) { $0 + Double($1.stock) * $1.costoPromedio }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    LabeledContent("Valor del inventario", value: valorInventario.soles)
                        .font(.headline)
                }

                Section("Productos") {
                    ForEach(filtrados) { producto in
                        Button {
                            if sesion.esSupervisor {
                                productoAEditar = producto
                            }
                        } label: {
                            FilaProducto(producto: producto)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        .deleteDisabled(!sesion.esSupervisor)
                    }
                    .onDelete(perform: borrar)
                }
            }
            .searchable(text: $busqueda, prompt: "Buscar producto")
            .navigationTitle("Productos")
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
                FormularioProductoView(producto: nil)
            }
            .sheet(item: $productoAEditar) { producto in
                FormularioProductoView(producto: producto)
            }
            .alert("No se puede borrar", isPresented: $mostrarMensaje) {
                Button("Entendido", role: .cancel) {}
            } message: {
                Text(mensaje)
            }
        }
    }

    // Solo el supervisor borra, y no se puede borrar un producto con compras (.deny)
    private func borrar(_ posiciones: IndexSet) {
        for posicion in posiciones {
            let producto = filtrados[posicion]
            if producto.compras.isEmpty {
                contexto.delete(producto)
            } else {
                mensaje = "\"\(producto.nombre)\" ya tiene compras registradas."
                mostrarMensaje = true
            }
        }
        try? contexto.save()
    }
}

struct FilaProducto: View {
    let producto: Producto

    // Verde: más de 10 · Ámbar: de 6 a 10 · Rojo: 5 o menos
    private var colorStock: Color {
        if producto.stock > 10 { return .green }
        if producto.stock >= 6 { return .orange }
        return .red
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(producto.nombre)
                    .font(.headline)
                Text("\(producto.categoria) · Costo prom. \(producto.costoPromedio.soles)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("Stock \(producto.stock)")
                .font(.subheadline.bold())
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(colorStock.opacity(0.18))
                .foregroundStyle(colorStock)
                .clipShape(Capsule())
        }
    }
}

// Formulario para crear o editar (producto nil = crear)
struct FormularioProductoView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(\.dismiss) private var dismiss

    let producto: Producto?
    @State private var nombre: String
    @State private var categoria: String
    @State private var stock: Int
    @State private var costo: Double

    init(producto: Producto?) {
        self.producto = producto
        _nombre = State(initialValue: producto?.nombre ?? "")
        _categoria = State(initialValue: producto?.categoria ?? "")
        _stock = State(initialValue: producto?.stock ?? 0)
        _costo = State(initialValue: producto?.costoPromedio ?? 0)
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nombre", text: $nombre)
                TextField("Categoría", text: $categoria)
                LabeledContent("Stock") {
                    TextField("0", value: $stock, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                LabeledContent("Costo promedio (S/)") {
                    TextField("0.00", value: $costo, format: .number)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
            }
            .navigationTitle(producto == nil ? "Nuevo producto" : "Editar producto")
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
        if let producto {
            producto.nombre = nombre.recortado
            producto.categoria = categoria.recortado
            producto.stock = stock
            producto.costoPromedio = costo
        } else {
            contexto.insert(Producto(nombre: nombre.recortado, categoria: categoria.recortado, stock: stock, costoPromedio: costo))
        }
        try? contexto.save()
        dismiss()
    }
}

