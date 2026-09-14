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
