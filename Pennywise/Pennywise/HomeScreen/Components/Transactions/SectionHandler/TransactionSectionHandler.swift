//
//  TransactionSectionHandler.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/27/23.
//

import UIKit

final class TransactionSectionHandler: NSObject, SectionHandler {
    
    let viewModel: TransactionSectionViewModel?
    
    init(viewModel: TransactionSectionViewModel?) {
        self.viewModel = viewModel
    }
    
    var numberOfRows: Int {
        return self.viewModel?.numberOfRows ?? 1
    }
    
    func getReuseableIdentifiers() -> [String] {
        ["TransactionTableViewCell"]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell",
                                                       for: indexPath) as? TransactionTableViewCell else {
            return UITableViewCell()
        }
        cell.resetData()
        cell.recentTransactionDataSetup(recentTransaction: self.viewModel?.setUpTransactionData(index: indexPath.row))
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        headerView.backgroundColor = UIColor.white
        label.text = "Recent Transaction"
        label.textColor = UIColor.blackMedium
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        NSLayoutConstraint.activate([
                    label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,
                                                   constant: 16),
                    label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
                ])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
}
