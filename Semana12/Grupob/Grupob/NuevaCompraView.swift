import SwiftUI
import SwiftData

// B5 · Nueva compra
struct NuevaCompraView: View {
    @Environment(\.modelContext) private var contexto
    @Environment(Sesion.self) private var sesion
    @Query(sort: \Proveedor.nombre) private var proveedores: [Proveedor]
    @Query(sort: \Producto.nombre) private var productos: [Producto]

    @State private var proveedor: Proveedor?
    @State private var producto: Producto?
    @State private var cantidad = 1
    @State private var costoUnitario = 0.0
    @State private var alCredito = false
    @State private var fecha = Date.now
    @State private var mensaje = ""
    @State private var mostrarMensaje = false

    private var subtotal: Double {
        Double(cantidad) * costoUnitario
    }

    private var igv: Double {
        Reglas.igv(subtotal: subtotal)
    }

    private var total: Double {
        Reglas.redondear(subtotal + igv)
    }

    private var requiereAprobacion: Bool {
        Reglas.requiereAprobacion(total: total)
    }

    private var formularioValido: Bool {
        proveedor != nil && producto != nil && costoUnitario > 0 && cantidad > 0
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Compra") {
                    Picker("Proveedor", selection: $proveedor) {
                        Text("Elegir…").tag(Proveedor?.none)
                        ForEach(proveedores) { item in
                            Text(item.nombre).tag(Optional(item))
                        }
                    }
                    Picker("Producto", selection: $producto) {
                        Text("Elegir…").tag(Producto?.none)
                        ForEach(productos) { item in
                            Text(item.nombre).tag(Optional(item))
                        }
                    }
                    Stepper("Cantidad: \(cantidad)", value: $cantidad, in: 1...100000)
                    LabeledContent("Costo unitario (S/)") {
                        TextField("0.00", value: $costoUnitario, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                    // La fecha permite registrar una compra pasada (sirve para probar VENCIDA)
                    DatePicker("Fecha de compra", selection: $fecha, in: ...Date.now, displayedComponents: .date)
                }

                Section("Forma de pago") {
                    Picker("Pago", selection: $alCredito) {
                        Text("Contado").tag(false)
                        Text("Crédito 30 días").tag(true)
                    }
                    .pickerStyle(.segmented)
                }

                Section("Resumen") {
                    LabeledContent("Subtotal", value: subtotal.soles)
                    LabeledContent("IGV 18 %", value: igv.soles)
                    LabeledContent("Total", value: total.soles)
                        .font(.headline)
                    if requiereAprobacion {
                        Label("Desde S/ 5,000 la compra necesita aprobación del supervisor",
                              systemImage: "exclamationmark.triangle.fill")
                            .font(.footnote)
                            .foregroundStyle(.orange)
                    }
                }

                if proveedores.isEmpty || productos.isEmpty {
                    Text("El supervisor debe registrar proveedores y productos primero.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Section {
                    Button(requiereAprobacion ? "Enviar a aprobación" : "Registrar compra") {
                        registrar()
                    }
                    .disabled(!formularioValido)
                }
            }
            .navigationTitle("Nueva compra")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    MenuCuenta()
                }
            }
            .alert("Listo", isPresented: $mostrarMensaje) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(mensaje)
            }
        }
    }

    private func registrar() {
        guard let proveedor, let producto, let comprador = sesion.usuario else { return }

        let pendiente = requiereAprobacion
        let compra = Compra(
            fecha: fecha,
            cantidad: cantidad,
            costoUnitario: costoUnitario,
            igv: igv,
            total: total,
            alCredito: alCredito,
            vence: Reglas.fechaVencimiento(desde: fecha, alCredito: alCredito),
            estado: pendiente ? "Pendiente" : "Aprobada",
            pagada: !alCredito
        )
        contexto.insert(compra)
        compra.comprador = comprador
        compra.proveedor = proveedor
        compra.producto = producto

        // Solo una compra aprobada cambia stock y costo promedio
        if !pendiente {
            Reglas.aplicarEfectos(de: compra)
        }
        try? contexto.save()

        mensaje = pendiente
            ? "La compra quedó pendiente de aprobación."
            : "La compra fue registrada."
        mostrarMensaje = true
        limpiar()
    }

    private func limpiar() {
        proveedor = nil
        producto = nil
        cantidad = 1
        costoUnitario = 0
        alCredito = false
        fecha = .now
    }
}

