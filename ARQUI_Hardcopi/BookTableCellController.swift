//
//  PhotoTableCellController.swift
//  ARQUI_Hardcopi
//
//  Created by Caro Obregon on 10/06/21.
//

import Foundation
import UIKit

class BookTableCellController: TableCellController {
    
    let item: String
    
    init(item: String) {
        self.item = item
    }
    
    let books = [
        Book(title: "Conversations with Friends: A Novel", name: "Caro Obregon",
             author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"),
        Book(title: "Dos", name: "Vale Obregon", author: "Sally Rooney", genre: "Fiction", body: "AFMKAMDFKM"),
        Book(title: "Tres", name: "Lucia Obregon",author: "Sally Rooney", genre: "Fiction", body: "AFMKAMDFKM"),
    ]
    
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.item, for: indexPath) as! BookTableViewCell
        let book = self.books[indexPath.row]
        cell.bookTitle?.text = book.title
        cell.authorName?.text = book.author
        cell.bodyTxt?.text = book.body
        cell.nameTxt?.text = book.name
        cell.genre?.text = book.genre
        cell.bookCover.sd_setImage(with: URL(string: (book.cover ?? "")), placeholderImage: UIImage(named: "HardcopiLogo.png"))
        cell.userImage.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "UserImage.png"))
        cell.userImage.makeRounded()
        
        return cell
    }
    func countFromtableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    
    func didSelectCell() {
        // Do something for photo...
    }
    
    func segueFromTableView(_ tableView: UITableView, selectedRow: Int) -> Any? {
        return nil
    }
    
}
