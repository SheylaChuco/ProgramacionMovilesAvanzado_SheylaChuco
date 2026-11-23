import Foundation

// Utilizando los métodos POST - PUT - DELETE
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
