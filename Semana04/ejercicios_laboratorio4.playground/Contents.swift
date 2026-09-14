// ===== CASO 1.5: HERENCIA Y POLIMORFISMO — LA CADENA DE SUCURSALES =====
// Docente: Juan León

enum CategoriaElectro {
    case lineaBlanca, tecnologia, pequenos
}

struct Electrodomestico {
    let nombre: String
    let marca: String
    let precioLista: Double
    let categoria: CategoriaElectro
}

// --- Clase base: define el FLUJO ---
class Sucursal {
    let nombre: String
    let ciudad: String

    init(nombre: String, ciudad: String) {
        self.nombre = nombre
        self.ciudad = ciudad
    }

    func descuento() -> Double {
        return 0.05
    }

    func costoEnvio(monto: Double) -> Double {
        return 30.0
    }

    // Este método NO se sobreescribe en las subclases
    func cotizar(item: Electrodomestico) {
        let precioConDescuento = item.precioLista * (1 - descuento())
        let envio = costoEnvio(monto: precioConDescuento)
        let total = precioConDescuento + envio
        print("\(nombre): \(item.nombre) -> S/ \(precioConDescuento) + envio S/ \(envio) = S/ \(total)")
    }
}

// --- TODO 14: SucursalLima ---
class SucursalLima: Sucursal {
    override func descuento() -> Double {
        return 0.10
    }
    override func costoEnvio(monto: Double) -> Double {
        if monto >= 1500 {
            return 0.0
        } else {
            return 30.0
        }
    }
}

// --- TODO 15: SucursalProvincia ---
class SucursalProvincia: Sucursal {
    override func costoEnvio(monto: Double) -> Double {
        let envio = monto * 0.08
        if envio < 50.0 {
            return 50.0
        } else {
            return envio
        }
    }
}

// --- TODO 16: SucursalOutlet ---
class SucursalOutlet: Sucursal {
    override func descuento() -> Double {
        return 0.25
    }
    override func costoEnvio(monto: Double) -> Double {
        return 0.0
    }
}

// --- TODO 17: recorrido polimórfico ---
let refrigeradora = Electrodomestico(nombre: "Refrigeradora", marca: "Frost", precioLista: 2000.0, categoria: .lineaBlanca)
let licuadora = Electrodomestico(nombre: "Licuadora", marca: "Mix", precioLista: 250.0, categoria: .pequenos)

let sucursales: [Sucursal] = [SucursalLima(nombre: "Lima Centro", ciudad: "Lima"),
                               SucursalProvincia(nombre: "Provincia Cusco", ciudad: "Cusco"),
                               SucursalOutlet(nombre: "Outlet Ate", ciudad: "Lima")]

print("===== Refrigeradora (S/ 2000.0) =====")
for sucursal in sucursales {
    sucursal.cotizar(item: refrigeradora)
}

print("===== Licuadora (S/ 250.0) =====")
for sucursal in sucursales {
    sucursal.cotizar(item: licuadora)
}

// --- TODO 18: prueba del polimorfismo ---
class SucursalOnline: Sucursal {
    override func costoEnvio(monto: Double) -> Double {
        return 15.0
    }
}
// Respuesta: solo necesité 4 líneas nuevas (la clase SucursalOnline con su
// override de costoEnvio). No toqué cotizar() ni los for-in: eso demuestra
// que agregar un nuevo tipo de sucursal no rompe el flujo polimórfico existente.

// ===== FIX: 2 errores =====
// Docente: Juan León
class SucursalMall: Sucursal {
    override func descuento() -> Double {
        // FIX 7: faltaba "override". Swift lo exige porque, sin esa palabra,
        // no puede distinguir si quieres reemplazar el método del padre o
        // si es un error tuyo al escribir uno nuevo con el mismo nombre.
        return 0.12
    }
}

class SucursalExpress: Sucursal {
    let radioKm: Int
    init(nombre: String, ciudad: String, radioKm: Int) {
        self.radioKm = radioKm
        // FIX 8: faltaba llamar a super.init. Toda subclase debe inicializar
        // primero sus propias propiedades y luego delegar en el init del
        // padre para que "nombre" y "ciudad" queden correctamente asignados.
        super.init(nombre: nombre, ciudad: ciudad)
    }
}

// ===== PREDICT: Qué imprime? =====
// Docente: Juan León
let misteriosa: Sucursal = SucursalLima(nombre: "Lima Centro", ciudad: "Lima")
print(misteriosa.descuento())
// PREDICT 6: imprime 0.10 (no 0.05). Aunque "misteriosa" está declarada como
// tipo Sucursal, el objeto real en memoria es un SucursalLima; Swift decide
// en tiempo de ejecución qué versión de descuento() usar según el tipo real.

let monto = 2000.0 * (1 - misteriosa.descuento())
print(misteriosa.costoEnvio(monto: monto))
// PREDICT 7: monto = 2000 * (1 - 0.10) = 1800.0. Como 1800 >= 1500,
// costoEnvio de SucursalLima devuelve 0.0.
