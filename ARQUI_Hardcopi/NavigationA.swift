//
//  NavigationA.swift
//  ARQUI_Hardcopi
//
//  Created by Arely Aceves on 10/06/21.
//

import UIKit

class NavigationA: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = "Current Requests"
        navBar.backgroundColor = UIColor(red: 254, green: 244, blue: 233, alpha: 1)

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