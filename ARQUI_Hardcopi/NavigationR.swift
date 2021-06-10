//
//  NavigationR.swift
//  ARQUI_Hardcopi
//
//  Created by Arely Aceves on 09/06/21.
//

import UIKit

class NavigationR: UINavigationController {

    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = "My Requests"
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
