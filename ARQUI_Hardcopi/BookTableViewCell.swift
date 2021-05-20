//
//  BookTableViewCell.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 20/05/21.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var bodyTxt: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
