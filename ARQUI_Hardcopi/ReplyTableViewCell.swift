//
//  ReplyTableViewCell.swift
//  ARQUI_Hardcopi
//
//  Created by Arturo Aceves Pérez on 10/06/21.
//

import UIKit

class ReplyTableViewCell: UITableViewCell {
    
    var actionBlock: (() -> Void)? = nil

    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var dateSent: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var accept: UIButton!
    @IBOutlet weak var deny: UIButton!
    @IBAction func didDenyButton(sender: UIButton) {
        actionBlock?()
    }
    @IBAction func didTapAccept(sender: UIButton) {
        //actionBlock?()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
