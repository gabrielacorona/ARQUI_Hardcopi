//
//  VCAddBook.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 19/05/21.
//

import UIKit
import GoogleBooksApiClient
import SZTextView

class VCAddBook: UIViewController {
    

    @IBOutlet weak var isbnTxt: UITextField!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var authorTxt: UITextField!
    @IBOutlet weak var genreTxt: UITextField!
    @IBOutlet weak var idiomaTxt: UITextField!
    @IBOutlet weak var conditionsTxt: SZTextView!
    @IBOutlet weak var descriptionTxt: SZTextView!
    @IBOutlet weak var postBtn: UIButton!
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
        let ISBN = sender.text ?? ""
        if(ISBN == "") {
            createAlert(message: "No has ingresado ningún ISBN.")
        } else {
            let req = GoogleBooksApi.VolumeRequest.List(query: "isbn:" + ISBN)
            let task: URLSessionDataTask = client.invoke(
                req,
                onSuccess: { volumes in self.onSuccess(volumeResults: volumes) },
                onError: { error in self.onError(errorContent: error) }
            )
            task.resume()
        }
        
    }
    func onError(errorContent: Any) {
        var message = "ISBN inválido."
        if("\(errorContent)" == "unknown") {
            message = "Error de conexión."
        }
        print(message)
        DispatchQueue.main.async {
            self.createAlert(message: message)
        }
    }
    
    func createAlert(message: String) {
        let alert = UIAlertController(title: "¡Ups!",
                                        message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
        self.isbnTxt.text = ""
        }
        self.present(alert, animated: true, completion: nil)
    }
    

    func onSuccess(volumeResults: Volumes) {
        
        let bookInfo = volumeResults.items[0].volumeInfo
        print(bookInfo)
        var bookTitle = bookInfo.title
        if(bookInfo.subtitle != nil) {
            bookTitle += ": " + bookInfo.subtitle!
        }
        let bookAuthors = bookInfo.authors.joined(separator: ", ")
        let bookGenre = bookInfo.categories.joined(separator: ", ")
        let bookDesc = (bookInfo.desc ?? "") // TODO add to storyboard
        var bookLang = (bookInfo.language ?? "") // TODO add to storyboard
        if(bookLang == "un") {
            bookLang = ""
        }
        
        DispatchQueue.main.async {
            self.titleTxt.text = bookTitle
            self.authorTxt.text = bookAuthors
            self.genreTxt.text = bookGenre
            self.idiomaTxt.text = bookLang
            self.descriptionTxt.text = bookDesc
        }
        
        print("Titulo: " + bookTitle)
        print("Autor(es): " + bookAuthors)
        print("Genero(s): " + bookGenre)
        print("Descripcion: " + bookDesc)
        print("Idioma: " + bookLang)
        
    }
    
    @IBAction func addBook(_ sender: Any) {
        
        print("Titulo: " + (self.titleTxt.text ?? "Empty"))
        print("Autor(es): " + (self.authorTxt.text ?? "Empty"))
        print("Genero(s): " + (self.genreTxt.text ?? "Empty"))
        print("Descripcion: " + (self.idiomaTxt.text ?? "Empty"))
        print("Idioma: " + (self.descriptionTxt.text ?? "Empty"))
        print("Descripción: " + (self.descriptionTxt.text ?? "Empty"))
        print("COndiciones: " + (self.conditionsTxt.text ?? "Empty"))
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
