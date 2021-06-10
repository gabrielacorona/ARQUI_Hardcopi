//
//  DetailTableViewCell.swift
//  ARQUI_Hardcopi
//
//  Created by Arturo Aceves Pérez on 10/06/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
