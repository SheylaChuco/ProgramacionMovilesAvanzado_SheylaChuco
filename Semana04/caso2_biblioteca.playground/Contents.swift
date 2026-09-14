// ===== CASO 1.5: HERENCIA Y POLIMORFISMO — LA CADENA DE SUCURSALES =====
// Docente: Juan León
//Sheyla Rosmery Chuco Bravo

enum CategoriaElectro {
    case lineaBlanca, tecnologia, pequenos
}

struct Electrodomestico {
    let nombre: String
    let marca: String
    let precioLista: Double
    let categoria: CategoriaElectro
}

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

    func cotizar(item: Electrodomestico) {
        let precioConDescuento = item.precioLista * (1 - descuento())
        let envio = costoEnvio(monto: precioConDescuento)
        let total = precioConDescuento + envio
        print("\(nombre): \(item.nombre) -> S/ \(precioConDescuento) + envio S/ \(envio) = S/ \(total)")
    }
}
// --- TODO 14 ---
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
// --- TODO 15 ---
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
// >>> COMMIT 3: "feat: Caso 1.5 - SucursalProvincia hereda descuento, override envio"

// --- TODO 16 ---
class SucursalOutlet: Sucursal {
    override func descuento() -> Double {
        return 0.25
    }
    override func costoEnvio(monto: Double) -> Double {
        return 0.0
    }
}

// --- TODO 17 y 18 ---
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

class SucursalOnline: Sucursal {
    override func costoEnvio(monto: Double) -> Double {
        return 15.0
    }
}
// Respuesta: solo necesité 4 líneas nuevas (la clase con su override).
// No toqué cotizar() ni los for-in.
// --- FIX y PREDICT ---
class SucursalMall: Sucursal {
    override func descuento() -> Double {
        // FIX 7: faltaba "override"; Swift lo exige para distinguir un
        // reemplazo intencional de un método nuevo con el mismo nombre.
        return 0.12
    }
}

class SucursalExpress: Sucursal {
    let radioKm: Int
    init(nombre: String, ciudad: String, radioKm: Int) {
        self.radioKm = radioKm
        // FIX 8: faltaba super.init; la subclase debe delegar en el init
        // del padre para inicializar nombre y ciudad.
        super.init(nombre: nombre, ciudad: ciudad)
    }
}

let misteriosa: Sucursal = SucursalLima(nombre: "Lima Centro", ciudad: "Lima")
print(misteriosa.descuento())
// PREDICT 6: imprime 0.10, porque el tipo real en memoria es SucursalLima
// (Swift despacha según el tipo real, no el tipo declarado).

let monto = 2000.0 * (1 - misteriosa.descuento())
print(misteriosa.costoEnvio(monto: monto))
// PREDICT 7: monto = 1800.0; como 1800 >= 1500, costoEnvio devuelve 0.0.

