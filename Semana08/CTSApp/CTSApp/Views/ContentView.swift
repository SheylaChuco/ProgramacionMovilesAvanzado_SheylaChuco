import SwiftUI
 
struct ContentView: View {
 
    // Paso actual: 1 a 5 = datos, 6 = revisión, 7 = resultado
    @State private var paso = 1
 
    // Datos que se van llenando en los pasos
    @State private var datos = DatosCTS()
 
    let titulos = [
        "Trabajador y periodo",
        "Tiempo trabajado",
        "Sueldo",
        "Pagos variables",
        "Días que no cuentan",
        "Revisa tus datos",
        "Tu CTS"
    ]
 
    // Texto pequeño de arriba
    var etiquetaPaso: String {
        if paso <= 5 {
            return "Paso \(paso) de 5"
        } else if paso == 6 {
            return "Revisión"
        } else {
            return "Resultado"
        }
    }
 
    // El botón Siguiente solo se activa si el paso está completo
    var puedeContinuar: Bool {
        switch paso {
        case 1:
            let nombre = datos.nombre.trimmingCharacters(in: .whitespaces)
            return !nombre.isEmpty && CalculadoraCTS.numero(datos.horasDiarias) > 0
        case 2:
            let r = CalculadoraCTS.calcular(datos)
            if datos.trabajoTodoElPeriodo {
                return true
            }
            let marcoAlgo = datos.entroDespues || datos.dejoLaEmpresa
            return marcoAlgo && r.finComputo >= r.inicioComputo
        case 3:
            return CalculadoraCTS.numero(datos.sueldo) > 0
            
        default:
            return true
        }
        
    }
 
    // Barra de progreso: 5 segmentos
    var barraProgreso: some View {
        HStack(spacing: 5) {
            ForEach(1...5, id: \.self) { i in
                Capsule()
                    .fill(i <= paso ? Color.blue : Color.gray.opacity(0.3))
                    .frame(height: 5)
            }
        }
    }
 
    // Contenido de cada paso
    @ViewBuilder
    var contenido: some View {
        switch paso {
        case 1: Paso1View(datos: $datos)
        case 2: Paso2View(datos: $datos)
        case 3: Paso3View(datos: $datos)
        case 4: Paso4View(datos: $datos)
        case 5: Paso5View(datos: $datos)
        case 6: Paso6View(datos: datos)
        default: Paso7View(datos: datos)
        }
    }
 
    // Botones de abajo
    var botones: some View {
        HStack(spacing: 10) {
 
            // Atrás: solo desde el paso 2 hasta la revisión
            if paso > 1 && paso < 7 {
                Button(action: { paso -= 1 }) {
                    Text("Atrás")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.primary)
                        .cornerRadius(12)
                }
            }
 
            if paso < 6 {
                Button(action: { paso += 1 }) {
                    Text("Siguiente")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(puedeContinuar ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .disabled(!puedeContinuar)
            } else if paso == 6 {
                Button(action: { paso = 7 }) {
                    Text("Calcular CTS")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            } else {
                Button(action: {
                    datos = DatosCTS()
                    paso = 1
                }) {
                    Text("Nuevo cálculo")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
    }
 
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
 
            // Encabezado
            VStack(alignment: .leading, spacing: 6) {
                Text("CALCULADORA DE CTS")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text(etiquetaPaso)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                barraProgreso
                Text(titulos[paso - 1])
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.top, 4)
            }
            .padding()
 
            // Contenido del paso
            ScrollView {
                contenido
                    .padding(.horizontal)
            }
 
            // Botones
            botones
        }
        .background(Color(.systemGroupedBackground))
    }
}
 
#Preview {
    ContentView()
}
