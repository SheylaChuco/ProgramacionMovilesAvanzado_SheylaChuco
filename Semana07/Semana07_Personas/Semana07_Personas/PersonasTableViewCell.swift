//
//  PersonasTableViewCell.swift
//  Semana07_Personas
//
//  Created by Tecsup on 14/10/26.
//

import UIKit

class PersonasTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var PersonaNombre: UILabel!
    
    @IBOutlet weak var PersonaImagen: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
