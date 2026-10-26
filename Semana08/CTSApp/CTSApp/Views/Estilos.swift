import SwiftUI

// Estilos que se repiten en todos los pasos
extension View {

    // Tarjeta blanca con esquinas redondeadas
    func tarjeta() -> some View {
        self
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(14)
    }

    // Caja gris para escribir
    func campo() -> some View {
        self
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(9)
    }
}
