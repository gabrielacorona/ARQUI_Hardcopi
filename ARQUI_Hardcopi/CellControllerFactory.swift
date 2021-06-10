//
//  CellControllerFactory.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 10/06/21.
//

import Foundation
import UIKit

class MyCellControllerFactory {

    
    func cellControllers(item : String) -> TableCellController {
        if item == "book" {
            return PhotoTableCellController(item: item)
        }
        return PhotoTableCellController(item: item)
    }
    
}
