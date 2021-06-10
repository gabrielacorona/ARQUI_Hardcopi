//
//  NavigationD.swift
//  ARQUI_Hardcopi
//
//  Created by Arturo Aceves Pérez on 10/06/21.
//

import UIKit

class NavigationD: UIViewController {
    
    let users = [Profile(id: "1", name: "Gaby Corona", email: "gaba@mail.com", phone: "8127364526"), Profile(id: "2", name: "Vale Obregon", email: "vale@mail.com", phone: "8129304526"), Profile(id: "3", name: "Arely Aceves", email: "arely@mail.com", phone: "2039474526"), Profile(id: "4", name: "Caro Obregon", email: "caro@mail.com", phone: "8738462526")]
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    var id = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = "Contact Card"
        navBar.backgroundColor = UIColor(red: 254/256, green: 244/256, blue: 233/256, alpha: 1)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
