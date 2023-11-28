//
//  HomeController.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import UIKit

final class HomeController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    private var sectionHandlers: [SectionHandler] = [SectionHandler]()
    
    
    lazy var vm: HomeScreenViewModel = {
        let homeScreenViewModel = HomeScreenViewModel()
        return homeScreenViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "TransactionTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "TransactionTableViewCell")
        self.navigationController?.setStatusBar(backgroundColor: UIColor.greenLight3)
        self.homeHeaderView()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
        setUpDatasource()
        
    }
    
    private func setUpDatasource() {
        self.vm.reloadData = {
            self.sectionHandlers.removeAll()
            self.homeHeaderView()
            
            if self.vm.setUpRecentTransactionDataModel().count > 0 {
                self.sectionHandlers.append(TransactionSectionHandler(viewModel: TransactionSectionViewModel(recentTransactionData: self.vm.setUpRecentTransactionDataModel())))
                self.tableView.reloadData()
            }
        }
    }
    
    func homeHeaderView() {
        if let homeView = Bundle.main.loadNibNamed("HomeHeaderView", owner: self, options: nil)?.first as? HomeHeaderView {
            homeView.removeFromSuperview()
            headerView.addSubview(homeView)
            headerViewHeight.constant = 200
            homeView.translatesAutoresizingMaskIntoConstraints = false
                       NSLayoutConstraint.activate( [
                        homeView.topAnchor.constraint(equalTo: headerView.topAnchor),
                        homeView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
                        homeView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
                        homeView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
                       ])
            
            homeView.setBackgroundColor()
            homeView.setRoundedCorners()
            homeView.setHeaderData(headerData: self.vm.setUpHeaderData())
        }
    }
    
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHandlers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionHandlers[safe: section]?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sectionHandlers[safe: indexPath.section]?.tableView(tableView, heightForRowAt: indexPath) ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sectionHandlers[safe: indexPath.section]?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        sectionHandlers[safe: indexPath.section]?.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sectionHandlers[safe: indexPath.section]?.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHandlers[safe: section]?.tableView(tableView, viewForHeaderInSection: section) ?? UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHandlers[safe: section]?.tableView(tableView, heightForHeaderInSection: section) ?? .zero
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sectionHandlers[safe: section]?.tableView(tableView, viewForFooterInSection: section) ?? UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionHandlers[safe: section]?.tableView(tableView, heightForFooterInSection: section) ?? .zero
    }
}

