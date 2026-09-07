struct Estacion {
    let nombre: String                // Nombre real (ej. "Gamarra")
    let linea: String                 // "L1", "L2", "L3", "L4"
    let avenidas: [String]            // Avenidas de acceso
    let tieneAscensores: Bool
    let tieneServiciosHigienicos: Bool
    let cantidadVagones: Int          // 6 en todas (dato fijo del sistema)
    let conexiones: [String]          // Nombres de estaciones/líneas con transbordo
    let esProyectada: Bool            // true = aún no construida (L3, L4)
    let tarifa: Double?               // nil si esProyectada == true
    let horario: String?              // nil si esProyectada == true
    let sedesDeportivas: [String]?    // Sedes deportivas cercanas (opcional)
}

// Tarifa y horario son reales (fuente: metrolima.net)
// Avenidas, ascensores y baños son placeholders temporales (TODO: completar con datos reales)

let horarioL1LunSab = "05:00 - 22:00"
let horarioL1Domingo = "05:30 - 22:00"
let tarifaL1 = 1.50

let estacionesLinea1: [String: Estacion] = [
    "villa el salvador": Estacion(nombre: "Villa El Salvador", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "parque industrial": Estacion(nombre: "Parque Industrial", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "pumacahua": Estacion(nombre: "Pumacahua", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "villa maria": Estacion(nombre: "Villa María", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "maria auxiliadora": Estacion(nombre: "María Auxiliadora", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "san juan": Estacion(nombre: "San Juan", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "atocongo": Estacion(nombre: "Atocongo", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "jorge chavez": Estacion(nombre: "Jorge Chávez", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "ayacucho": Estacion(nombre: "Ayacucho", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "cabitos": Estacion(nombre: "Cabitos", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "angamos": Estacion(nombre: "Angamos", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "san borja sur": Estacion(nombre: "San Borja Sur", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "la cultura": Estacion(nombre: "La Cultura", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L4"], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "arriola": Estacion(nombre: "Arriola", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "gamarra": Estacion(nombre: "Gamarra", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "miguel grau": Estacion(nombre: "Miguel Grau", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L5 (futura)"], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "el angel": Estacion(nombre: "El Ángel", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "presbitero maestro": Estacion(nombre: "Presbítero Maestro", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "caja de agua": Estacion(nombre: "Caja de Agua", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "piramide del sol": Estacion(nombre: "Pirámide del Sol", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "los jardines": Estacion(nombre: "Los Jardines", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "los postes": Estacion(nombre: "Los Postes", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "san carlos": Estacion(nombre: "San Carlos", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "san martin": Estacion(nombre: "San Martín", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "santa rosa": Estacion(nombre: "Santa Rosa", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil),
    "bayovar": Estacion(nombre: "Bayóvar", linea: "L1", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: tarifaL1, horario: horarioL1LunSab, sedesDeportivas: nil)
]

let horarioL2 = "05:00 - 22:00" // similar a L1 según fuente oficial
let tarifaL2 = 1.40 // se paga con Tarjeta TIT

let estacionesLinea2: [String: Estacion] = [
    "puerto del callao": Estacion(nombre: "Puerto del Callao", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "buenos aires": Estacion(nombre: "Buenos Aires", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "juan pablo ii": Estacion(nombre: "Juan Pablo II", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "insurgentes": Estacion(nombre: "Insurgentes", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "carmen de la legua": Estacion(nombre: "Carmen de La Legua", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "oscar r benavides": Estacion(nombre: "Óscar R. Benavides", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "san marcos": Estacion(nombre: "San Marcos", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "elio": Estacion(nombre: "Elio", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "la alborada": Estacion(nombre: "La Alborada", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "tingo maria": Estacion(nombre: "Tingo María", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "parque murillo": Estacion(nombre: "Parque Murillo", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "plaza bolognesi": Estacion(nombre: "Plaza Bolognesi", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "central l2": Estacion(nombre: "Central", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L3", "Metropolitano"], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "plaza manco capac": Estacion(nombre: "Plaza Manco Cápac", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "cangallo": Estacion(nombre: "Cangallo", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "28 de julio": Estacion(nombre: "28 de Julio", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "nicolas ayllon": Estacion(nombre: "Nicolás Ayllón", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "circunvalacion": Estacion(nombre: "Circunvalación", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "san juan de dios": Estacion(nombre: "San Juan de Dios", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "evitamiento": Estacion(nombre: "Evitamiento", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: 1.40, horario: "05:00 - 22:00", sedesDeportivas: nil),
    "ovalo santa anita": Estacion(nombre: "Óvalo Santa Anita", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: 1.40, horario: "05:00 - 22:00", sedesDeportivas: nil),
    "colectora industrial": Estacion(nombre: "Colectora Industrial", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: 1.40, horario: "05:00 - 22:00", sedesDeportivas: nil),
    "hermilio valdizan": Estacion(nombre: "Hermilio Valdizán", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: false, tarifa: 1.40, horario: "05:00 - 22:00", sedesDeportivas: nil),
    "mercado santa anita": Estacion(nombre: "Mercado Santa Anita", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L4"], esProyectada: false, tarifa: 1.40, horario: "05:00 - 22:00", sedesDeportivas: nil),
    "vista alegre": Estacion(nombre: "Vista Alegre", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "prolongacion javier prado": Estacion(nombre: "Prolongación Javier Prado", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "municipalidad de ate": Estacion(nombre: "Municipalidad de Ate", linea: "L2", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil)
]


let estacionesLinea3: [String: Estacion] = [
    "el alamo": Estacion(nombre: "El Álamo", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "huandoy": Estacion(nombre: "Huandoy", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "2 de octubre": Estacion(nombre: "2 de Octubre", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "villa sol": Estacion(nombre: "Villa Sol", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "naranjal": Estacion(nombre: "Naranjal", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "carlos izaguirre": Estacion(nombre: "Carlos Izaguirre", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "tomas valle": Estacion(nombre: "Tomás Valle", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "bartolome de las casas": Estacion(nombre: "Bartolomé de las Casas", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "jose granda": Estacion(nombre: "José Granda", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "caqueta": Estacion(nombre: "Caquetá", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "tacna": Estacion(nombre: "Tacna", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "garcilaso de la vega": Estacion(nombre: "Garcilaso de la Vega", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "central l3": Estacion(nombre: "Central", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L2"], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "parque de la reserva": Estacion(nombre: "Parque de la Reserva", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "museo de historia natural": Estacion(nombre: "Museo de Historia Natural", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "cesar canevaro": Estacion(nombre: "César Canevaro", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "conde de san isidro l3": Estacion(nombre: "Conde de San Isidro", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L4"], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "andres aramburu": Estacion(nombre: "Andrés Aramburú", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "huaca pucllana": Estacion(nombre: "Huaca Pucllana", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "parque central de miraflores": Estacion(nombre: "Parque Central de Miraflores", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "parque reducto": Estacion(nombre: "Parque Reducto", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "republica de panama": Estacion(nombre: "República de Panamá", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["Javier Prado (Estadio Nacional)"], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: ["Estadio Nacional"]),
    "juana alarco": Estacion(nombre: "Juana Alarco", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "alejandro velasco": Estacion(nombre: "Alejandro Velasco", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "las gardenias": Estacion(nombre: "Las Gardenias", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "los heroes": Estacion(nombre: "Los Héroes", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "pedro miotta": Estacion(nombre: "Pedro Miotta", linea: "L3", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil)
]

let estacionesLinea4: [String: Estacion] = [
    "venezuela": Estacion(nombre: "Venezuela", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "rafael escardo": Estacion(nombre: "Rafael Escardo", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "pando": Estacion(nombre: "Pando", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "jose de sucre": Estacion(nombre: "José de Sucre", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "brasil": Estacion(nombre: "Brasil", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "felipe salaverry": Estacion(nombre: "Felipe Salaverry", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "guillermo prescott": Estacion(nombre: "Guillermo Prescott", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "las palmeras": Estacion(nombre: "Las Palmeras", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "conde de san isidro l4": Estacion(nombre: "Conde de San Isidro", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L3"], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "rivera navarrete": Estacion(nombre: "Rivera Navarrete", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "pablo carriquiry": Estacion(nombre: "Pablo Carriquiry", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "la cultura l4": Estacion(nombre: "La Cultura", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L1"], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "san luis": Estacion(nombre: "San Luis", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "monterrico": Estacion(nombre: "Monterrico", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "manuel olguin": Estacion(nombre: "Manuel Olguín", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "los frutales": Estacion(nombre: "Los Frutales", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "la molina": Estacion(nombre: "La Molina", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "santa patricia": Estacion(nombre: "Santa Patricia", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "mayorazgo": Estacion(nombre: "Mayorazgo", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: [], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil),
    "mercado santa anita l4": Estacion(nombre: "Mercado Santa Anita", linea: "L4", avenidas: ["Por definir"], tieneAscensores: true, tieneServiciosHigienicos: true, cantidadVagones: 6, conexiones: ["L2"], esProyectada: true, tarifa: nil, horario: nil, sedesDeportivas: nil)
]

var estacionesMetroLima: [String: Estacion] = [:]
estacionesMetroLima.merge(estacionesLinea1) { (actual, _) in actual }
estacionesMetroLima.merge(estacionesLinea2) { (actual, _) in actual }
estacionesMetroLima.merge(estacionesLinea3) { (actual, _) in actual }
estacionesMetroLima.merge(estacionesLinea4) { (actual, _) in actual }


import Foundation

// Normaliza: minúsculas, sin espacios extra, sin tildes/diacríticos
func normalizar(_ texto: String) -> String {
    return texto
        .folding(options: .diacriticInsensitive, locale: .current)
        .lowercased()
        .trimmingCharacters(in: .whitespaces)
}

// Índice de búsqueda: nombre normalizado -> lista de estaciones que coinciden
var indiceBusqueda: [String: [Estacion]] = [:]

func registrarEnIndice(_ diccionarioLinea: [String: Estacion]) {
    for estacion in diccionarioLinea.values {
        let clave = normalizar(estacion.nombre)
        indiceBusqueda[clave, default: []].append(estacion)
    }
}

registrarEnIndice(estacionesLinea1)
registrarEnIndice(estacionesLinea2)
registrarEnIndice(estacionesLinea3)
registrarEnIndice(estacionesLinea4)

// RF-01: Búsqueda tolerante a mayúsculas, espacios y tildes
func buscarEstacion(_ entrada: String) -> [Estacion] {
    let clave = normalizar(entrada)
    return indiceBusqueda[clave] ?? []
}

// RF-02: Genera y muestra la ficha técnica de una estación
func mostrarFicha(_ estacion: Estacion) {
    print("=====================================================")
    print("FICHA DE ESTACIÓN: \(estacion.nombre)")
    print("=====================================================")
    print("Línea: \(estacion.linea)")
    print("Estado: \(estacion.esProyectada ? "Proyectada (aún no construida)" : "Operativa")")
    print("Avenidas de acceso: \(estacion.avenidas.joined(separator: ", "))")
    print("Ascensores: \(estacion.tieneAscensores ? "Sí" : "No")")
    print("Servicios higiénicos: \(estacion.tieneServiciosHigienicos ? "Sí" : "No")")
    print("Vagones por tren: \(estacion.cantidadVagones)")

    if let tarifa = estacion.tarifa {
        print(String(format: "Tarifa: S/ %.2f", tarifa))
    } else {
        print("Tarifa: No definida (línea proyectada)")
    }

    if let horario = estacion.horario {
        print("Horario: \(horario)")
    } else {
        print("Horario: No definido (línea proyectada)")
    }

    if !estacion.conexiones.isEmpty {
        print("Conexiones: \(estacion.conexiones.joined(separator: ", "))")
    }

    if let sedes = estacion.sedesDeportivas, !sedes.isEmpty {
        print("Sedes deportivas cercanas: \(sedes.joined(separator: ", "))")
    }
    print("=====================================================\n")
}

// Flujo completo: busca y decide qué mostrar según cuántos resultados haya
func consultarEstacion(_ entrada: String) {
    let resultados = buscarEstacion(entrada)

    switch resultados.count {
    case 0:
        print("Estación no localizada. Verifique el nombre e intente de nuevo.\n")
    case 1:
        mostrarFicha(resultados[0])
    default:
        print("Se encontraron \(resultados.count) estaciones con ese nombre. ¿Cuál desea consultar?")
        for (indice, estacion) in resultados.enumerated() {
            print("\(indice + 1). \(estacion.nombre) - \(estacion.linea)")
        }
        if let opcion = readLine(), let numero = Int(opcion), numero >= 1, numero <= resultados.count {
            mostrarFicha(resultados[numero - 1])
        } else {
            print("Opción inválida. Volviendo al menú.\n")
        }
    }
}
