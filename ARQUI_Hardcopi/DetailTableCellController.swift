//
//  RequestTableCellController.swift
//  ARQUI_Hardcopi
//
//  Created by Arely Aceves on 10/06/21.
//

import Foundation
import UIKit

class DetailTableCellController: TableCellController {
    
    let item: String
    
    init(item: String) {
        self.item = item
    }
    
    var requests = [
        Request(to: "1", from: "4", time: "2021-05-19", status: "Pending", book: Book(title: "Conversations With Friends", name: "Caro Obregon", author: "Sally Rooney", genre: "Fiction", body: "Conversations with Friends is a book about four people: two best friends, Frances and Bobbi, and a married couple, Nick and Melissa. Frances and Nick end up falling, over time, into a strange romance.", cover: "https://books.google.com/books/content?id=4ZQnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")),
        Request(to: "2", from: "4", time: "2021-05-20", status: "Pending", book: Book(title: "Twilight", name: "Caro Obregon", author: "Stephanie Meyers", genre: "Fiction", body: "Fall in love with the addictive, suspenseful love story between a teenage girl and a vampire with the book that sparked a literary phenomenon and redefined romance for a generation")),
        Request(to: "3", from: "4", time: "2021-05-21", status: "Pending", book: Book(title: "Don Quixote", name: "Caro Obregon", author: "Miguel de Cervantes", genre: "Fiction", body: "A founding work of Western literature, it is often labeled as the first modern novel and is considered one of the greatest works ever written."))
    ]
    
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.item, for: indexPath) as! ReplyTableViewCell
        let request = requests[indexPath.row]
        
        cell.title?.text = request.book.title
        cell.userName?.text = request.book.name
        cell.dateSent?.text = request.time
        
        return cell
    }
    
    func countFromtableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func segueFromTableView(_ tableView: UITableView, selectedRow: Int) -> Any? {
        if selectedRow < requests.count && requests.count > 0 {
            requests.remove(at: selectedRow)
            tableView.reloadData()
            return true
            
        }
        
        return false
    }

    
    func didSelectCell() {
        // Do something for photo...
    }
    
}

