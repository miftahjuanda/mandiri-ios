//
//  ListGenreViewController.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

internal final class ListGenreViewController: UIViewController {
    // MARK: - Properties
    weak var presenter: ViewToPresenterListGenreProtocol?
    
    private lazy var genreTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GenreViewCell.self, forCellReuseIdentifier: GenreViewCell.reusableId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
            tableView.sectionFooterHeight = 0
        }
        
        return tableView
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuiGenre()
    }
    
    private func setuiGenre() {
        view.backgroundColor = .colorEbonyClay
        
        view.addSubview(genreTableView)
        genreTableView.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        })
    }
    
}

extension ListGenreViewController: PresenterToViewListGenreProtocol{
    // TODO: Implement View Output Methods
}

extension ListGenreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GenreViewCell.reusableId, for: indexPath) as? GenreViewCell {
            cell.bindData(title: "\(indexPath.row + 1). title.")
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
