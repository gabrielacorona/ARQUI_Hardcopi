//
//  RequestTableViewCell.swift
//  ARQUI_Hardcopi
//
//  Created by Arely Aceves on 09/06/21.
//

import UIKit

class RequestTableViewCell: UITableViewCell {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var bodyTxt: UILabel!
    @IBOutlet weak var statusTxt: UILabel!
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
       
    override func awakeFromNib() {

        super.awakeFromNib()
           // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
