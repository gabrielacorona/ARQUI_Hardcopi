//
//  VCAddBook.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 19/05/21.
//

import UIKit
import GoogleBooksApiClient

class VCAddBook: UIViewController {
    
    let client = GoogleBooksApiClient(session: URLSession.shared)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let req = GoogleBooksApi.VolumeRequest.List(query: "Google")
        let task: URLSessionDataTask = client.invoke(
            req,
            onSuccess: { volumes in NSLog("\(volumes)") },
            onError: { error in NSLog("\(error)") }
        )
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterIsbn(_ sender: UITextField) {
        print(sender.text ?? "nil")
        
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
