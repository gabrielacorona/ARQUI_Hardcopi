//
//  TableCellController.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 10/06/21.
//

import Foundation
import UIKit
protocol TableCellController {
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell
    func didSelectCell()
}
