import UIKit

class ViewControllerConfirmacion: UIViewController {
    // instanciar la clase ClienteModel
    var pCliente: ClienteModel = ClienteModel()

    @IBOutlet weak var tfApellido: UILabel!
    @IBOutlet weak var tfNombre: UILabel!
    @IBOutlet weak var tfDni: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // definir los controles
        self.tfApellido.text = pCliente.Apellido
        self.tfNombre.text = pCliente.Nombre
        self.tfDni.text = pCliente.Dni
    }
}
