//
//  TransactionTableViewCell.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/27/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var transactionTypeLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    @IBOutlet weak var transactionDateLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resetData() {
        categoryImageView.image = nil
        transactionLabel.text = ""
        transactionTypeLabel.text = ""
        transactionAmountLabel.text = ""
        transactionDateLabel.text = ""
    }
    
    func recentTransactionDataSetup() {
        categoryImageView.image = UIImage.init(systemName: "house.fill")
        transactionLabel.text = "Rent Payment"
        transactionLabel.textColor = UIColor.blackHigh
        transactionLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        transactionTypeLabel.text = "Housing"
        transactionTypeLabel.textColor = UIColor.blackMedium
        transactionTypeLabel.font = UIFont.systemFont(ofSize: 14)
        
        transactionAmountLabel.text = "-$800"
        transactionAmountLabel.textColor = UIColor.redDark
        transactionAmountLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        transactionDateLabel.text = "Nov 27/2023"
        transactionDateLabel.textColor = UIColor.blackMedium
        transactionDateLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
}


struct TransactionDataModel {
    
}
