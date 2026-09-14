// ===== CASO 2 — PARTE B: BIBLIOTECA (CON IA) =====
// Docente: Juan León
//Sheyla Rosmery Chuco Bravo

enum EstadoLibro { // define los dos posibles estados de un libro
    case disponible // el libro puede prestarse
    case prestado   // el libro ya está prestado
}

struct Libro { // dato de valor: cada copia es independiente
    let titulo: String // no cambia una vez creado
    let autor: String  // no cambia una vez creado
    var estado: EstadoLibro = .disponible // empieza disponible por defecto
}

class Biblioteca { // clase: todos deben ver los mismos préstamos (referencia)
    var libros: [Libro] = [] // arranca vacía, se llena con agregar()

    func agregar(libro: Libro) {
        libros.append(libro) // añade el libro al final del array
    }

    func prestar(titulo: String) -> Bool {
        for i in 0..<libros.count { // recorre por índice, no por closures
            if libros[i].titulo == titulo { // compara el título del libro actual
                if libros[i].estado == .disponible { // solo si está libre
                    libros[i].estado = .prestado // modifica el struct DENTRO del array
                    print("Préstamo aprobado: \(titulo)")
                    return true
                } else {
                    print("Error: \(titulo) ya está prestado")
                    return false
                }
            }
        }
        print("Error: no existe \(titulo)") // no se encontró en el bucle
        return false
    }

    func devolver(titulo: String) -> Bool {
        for i in 0..<libros.count { // misma lógica de búsqueda por índice
            if libros[i].titulo == titulo {
                if libros[i].estado == .prestado { // solo si estaba prestado
                    libros[i].estado = .disponible // lo regresa a disponible
                    print("Devolución registrada: \(titulo)")
                    return true
                } else {
                    print("Error: \(titulo) no estaba prestado")
                    return false
                }
            }
        }
        print("Error: no existe \(titulo)")
        return false
    }

    func inventario() {
        print("===== INVENTARIO =====")
        for libro in libros { // recorre todos los libros guardados
            switch libro.estado { // switch en vez de if/else para el estado
            case .disponible:
                print("\(libro.titulo) (\(libro.autor)) - disponible")
            case .prestado:
                print("\(libro.titulo) (\(libro.autor)) - prestado")
            }
        }
    }
}

// --- Simulación ---
let biblioteca = Biblioteca()
biblioteca.agregar(libro: Libro(titulo: "Cien años de soledad", autor: "Gabriel García Márquez"))
biblioteca.agregar(libro: Libro(titulo: "La ciudad y los perros", autor: "Mario Vargas Llosa"))
biblioteca.agregar(libro: Libro(titulo: "El Quijote", autor: "Miguel de Cervantes"))

biblioteca.prestar(titulo: "La ciudad y los perros")
biblioteca.prestar(titulo: "La ciudad y los perros")
biblioteca.devolver(titulo: "La ciudad y los perros")
biblioteca.prestar(titulo: "El Quijote")
biblioteca.prestar(titulo: "El Principito")
biblioteca.inventario()
