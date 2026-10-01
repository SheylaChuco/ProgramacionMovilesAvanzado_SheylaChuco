//
//  ViewControllerResultado.swift
//  Semana06_03
//
//  Created by Tecsup on 1/10/26.
//

import UIKit

class ViewControllerResultado: UIViewController {
    
    var pVenta: VentaModel = VentaModel()


    @IBOutlet weak var lblCuota: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblIntereses: UILabel!
    @IBOutlet weak var lblBase: UILabel!
    @IBOutlet weak var lblIgv: UILabel!
    @IBOutlet weak var lblSubtotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblSubtotal.text = String(format: "S/. %.2f", pVenta.subtotal)
        self.lblIgv.text = String(format: "S/. %.2f", pVenta.igv)
        self.lblBase.text = String(format: "S/. %.2f", pVenta.base)
        self.lblIntereses.text = String(format: "S/. %.2f", pVenta.intereses)
        self.lblTotal.text = String(format: "S/. %.2f", pVenta.total)
        self.lblCuota.text = String(format: "S/. %.2f", pVenta.cuota)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
