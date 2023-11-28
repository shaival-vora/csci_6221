//
//  TransactionSectionHandler.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/27/23.
//

import UIKit

final class TransactionSectionHandler: NSObject, SectionHandler {
    
    var numberOfRows: Int {
        return 100
    }
    
    func getReuseableIdentifiers() -> [String] {
        ["TransactionTableViewCell"]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell",
                                                       for: indexPath) as? TransactionTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = ""
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = "World"
        cell.selectionStyle = .none
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.redDark
            cell.textLabel?.text = "Hello"
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
