//
//  VCSignUp.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 19/05/21.
//

import UIKit

class VCSignUp: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var emailBtn: UITextField!
    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        if (emailBtn.text == "" || userTxt.text == "" || passwordTxt.text == "" || confirmPass.text == ""){
            print("missing more than one field")
            let alert = UIAlertController(title: "Missing more than one field", message: "Missing more than one param", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordTxt.text == confirmPass.text {
            print("adding user", emailBtn.text!, userTxt.text!, passwordTxt.text!, confirmPass.text!)
//            user.append[{emailBtn.text, userTxt.text, passwordTxt.text, confirmPass.text})
        }else{
            let alert = UIAlertController(title: "Passwords Don't Match", message: "Passwords Don't Match, Please Verify", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
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
