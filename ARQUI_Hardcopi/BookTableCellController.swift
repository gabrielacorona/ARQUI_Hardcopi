//
//  PhotoTableCellController.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 10/06/21.
//

import Foundation
import UIKit

class BookTableCellController: TableCellController {
    
    let item: String
    
    init(item: String) {
        self.item = item
    }
    
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.item, for: indexPath) as! BookTableViewCell
        cell.bookTitle.text = "prueba"
        cell.authorName.text = "autor"
        cell.bodyTxt.text = "body"
        
        return cell
    }
    
    func didSelectCell() {
        // Do something for photo...
    }
    
}
