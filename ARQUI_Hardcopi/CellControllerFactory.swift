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
            print("in book")
            return BookTableCellController(item: item)
        }
        if item == "request" {
            print("in request")
            return RequestTableCellController(item: item)
        }
        if item == "current" {
            print("in current")
            return DetailTableCellController(item: item)
        }
        print(item)
        return BookTableCellController(item: item)
    }
    
}
