//
//  Request.swift
//  ARQUI_Hardcopi
//
//  Created by Arturo Aceves Pérez on 10/06/21.
//

import UIKit

class Request: NSObject {
    var to: String
    var from: String
    var time: String
    var status: String
    var book: Book
    
    init(to: String, from: String, time: String, status: String, book: Book) {
        self.to = to
        self.from = from
        self.time = time
        self.status = status
        self.book = book
    }

}
