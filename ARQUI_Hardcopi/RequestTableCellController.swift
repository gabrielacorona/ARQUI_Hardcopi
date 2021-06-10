//
//  RequestTableCellController.swift
//  ARQUI_Hardcopi
//
//  Created by Arely Aceves on 10/06/21.
//

import Foundation
import UIKit

class RequestTableCellController: TableCellController {
    
    let item: String
    
    init(item: String) {
        self.item = item
    }
    
    let requests = [
        Request(to: "1", from: "Caro Obregon", time: "2021-05-20", status: "Accepted", book: Book(title: "Uno", name: "Gaby Corona", author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")),
        Request(to: "2", from: "Caro Obregon", time: "2021-05-20", status: "Pending", book: Book(title: "Uno", name: "Vale Obregon", author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")),
        Request(to: "3", from: "Caro Obregon", time: "2021-05-20", status: "Pending", book: Book(title: "Uno", name: "Arely Aceves", author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"))
    ]
    
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.item, for: indexPath) as! RequestTableViewCell
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
        
        return cell
    }
    func countFromtableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    func segueFromTableView(_ tableView: UITableView, selectedRow: Int) -> Any? {
        if requests[selectedRow].status == "Accepted" {
            return requests[selectedRow].to
        }
        return nil
    }

    
    func didSelectCell() {
        // Do something for photo...
    }
    
}

