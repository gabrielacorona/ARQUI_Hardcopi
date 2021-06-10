//
//  RequestTableViewController.swift
//  ARQUI_Hardcopi
//
//  Created by Arely Aceves on 09/06/21.
//

import UIKit

struct Request {
    var to: String
    var from: String
    var time: String
    var status: String
    var book: Book
}

class RequestTableViewController: UITableViewController {
    
    let requests = [
        Request(to: "Gaby Corona", from: "Caro Obregon", time: "2021-05-20", status: "Accepted", book: Book(title: "Uno", name: "Gaby Corona", author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")),
        Request(to: "Vale Obregon", from: "Caro Obregon", time: "2021-05-20", status: "Pending", book: Book(title: "Uno", name: "Vale Obregon", author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")),
        Request(to: "Arely Aceves", from: "Caro Obregon", time: "2021-05-20", status: "Pending", book: Book(title: "Uno", name: "Arely Aceves", author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"))
    ]
    


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
        return requests.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookcell", for: indexPath) as! RequestTableViewCell
        
        let request = requests[indexPath.row]
        cell.bookTitle?.text = request.book.title
        cell.authorName?.text = request.book.author
        cell.bodyTxt?.text = request.book.body
        cell.statusTxt?.text = request.status
        cell.genre?.text = request.book.genre
        cell.nameTxt?.text = request.book.name
        cell.bookCover.sd_setImage(with: URL(string: (request.book.cover ?? "http://www.domain.com/path/to/image.jpg")), placeholderImage: UIImage(named: "HardcopiLogo.png"))
        cell.userImage.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "UserImage.png"))
        cell.userImage.makeRounded()
        if request.status == "Accepted" {
            cell.statusTxt.textColor = UIColor(red: 122/256, green: 225/256, blue: 110/256, alpha: 1)        }
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
