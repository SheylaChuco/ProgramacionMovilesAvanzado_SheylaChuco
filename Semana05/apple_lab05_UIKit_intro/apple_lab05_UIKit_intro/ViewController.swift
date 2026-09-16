//
//  ViewController.swift
//  apple_lab05_UIKit_intro
//
//  Created by Tecsup on 16/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resulLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        resulLabel.text="Ingrese su peso y altura"
        
    }
    
    @IBAction func CalcularResultado(_ sender: Any) {
        let weight = Double(weightTextField.text ?? "") ?? 0
        let height = Double(heightTextField.text ?? "") ?? 0

        if weight == 0 || height == 0 {
            resulLabel.text = "Por favor, ingresa valores válidos."
            return
        }

        let bmi = weight / (height * height)

        var status = ""
        if bmi < 18.5 {
            status = "Bajo peso"
        } else if bmi < 24.9 {
            status = "Peso normal"
        } else if bmi < 29.9 {
            status = "Sobrepeso"
        } else {
            status = "Obesidad"
        }

        resulLabel.text = "IMC: \(String(format: "%.2f", bmi)) - \(status)"
    }
}

