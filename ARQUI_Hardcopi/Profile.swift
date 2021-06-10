//
//  Profile.swift
//  ARQUI_Hardcopi
//
//  Created by Arturo Aceves Pérez on 10/06/21.
//

import UIKit

class Profile: NSObject {
    
    var id: String
    var name: String
    var email: String
    var phone: String
    var about: String?
    
    init(id: String, name: String, email: String, phone: String, about: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.about = about
    
    }

}
