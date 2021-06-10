//
//  FeedTableViewController.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 20/05/21.
//

import UIKit
import SDWebImage

struct Book {
    var title: String
    var name: String
    var author: String
    var genre: String
    var body: String
    var cover: String?
}

class FeedTableViewController: UITableViewController {

    // TODO que se wrappeen las descripciones

    let books = [
        Book(title: "Conversations with Friends: A Novel", name: "Caro Obregon",
             author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"),
        Book(title: "Dos", name: "Vale Obregon", author: "Sally Rooney", genre: "Fiction", body: "AFMKAMDFKM"),
        Book(title: "Tres", name: "Lucia Obregon",author: "Sally Rooney", genre: "Fiction", body: "AFMKAMDFKM"),
    ]
    
    // TODO que se busquen
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 254/256, green: 244/256, blue: 233/256, alpha: 1)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookcell", for: indexPath) as! BookTableViewCell
        
        let book = books[indexPath.row]
        cell.bookTitle?.text = book.title
        cell.authorName?.text = book.author
        cell.bodyTxt?.text = book.body
        cell.nameTxt?.text = book.name
        cell.genre?.text = book.genre
        cell.bookCover.sd_setImage(with: URL(string: (book.cover ?? "http://www.domain.com/path/to/image.jpg")), placeholderImage: UIImage(named: "HardcopiLogo.png"))
        cell.userImage.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "UserImage.png"))
        cell.userImage.makeRounded()
        
        // Configure the cell... 

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
