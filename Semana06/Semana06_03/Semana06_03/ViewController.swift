//
//  ViewController.swift
//  Semana06_03
//
//  Created by Tecsup on 1/10/26.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tfTasa: UITextField!
    @IBOutlet weak var tfMeses: UITextField!
    @IBOutlet weak var tfCantidad: UITextField!
    @IBOutlet weak var tfPrecio: UITextField!
    @IBOutlet weak var tfElectrodomestico: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultado" {
            // leer los datos
            let precio = Double(self.tfPrecio.text!) ?? 0
            let cantidad = Double(self.tfCantidad.text!) ?? 0
            let meses = Double(self.tfMeses.text!) ?? 1
            let tasa = Double(self.tfTasa.text!) ?? 0

            // calculos
            let subtotal = precio * cantidad
            let igv = subtotal * 0.18
            let base = subtotal + igv
            let intereses = base * (tasa / 100) * meses
            let total = base + intereses
            var cuota = total
            if meses > 0 {
                cuota = total / meses
            }

            // armar el modelo
            let oVenta = VentaModel()
            oVenta.subtotal = subtotal
            oVenta.igv = igv
            oVenta.base = base
            oVenta.intereses = intereses
            oVenta.total = total
            oVenta.cuota = cuota

            // pasarlo a la pantalla Resultado
            let destino = segue.destination as! ViewControllerResultado
            destino.pVenta = oVenta
        }
    }


}

