//
//  DetailViewController.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit
import WebKit

internal final class DetailViewController: UIViewController {
    // MARK: - Properties
    weak var presenter: ViewToPresenterDetailProtocol?
    
    private lazy var headerVStack = StackView(.vertical) {
        webView
        titleLabel
        spacerInHeader
    }
    private lazy var webView: WKWebView = {
        let web = WKWebView()
        web.backgroundColor = .clear
        web.snp.makeConstraints { make in
            make.height.equalTo(view.frame.width/1.7)
        }
        if let videoURL = URL(string: "https://www.youtube.com/embed/6SGUlutHc1w") {
            let request = URLRequest(url: videoURL)
            web.load(request)
        }
        return web
    }()
    private let titleLabel = LabelView("Spider-Man: Across the Spider-Verse.", font: .boldSystemFont(ofSize: 18))
        .setPadding(.init(top: 20, left: 15, bottom: 10, right: 15))
    private let spacerInHeader = SpacerView()
    
    
    private lazy var detailTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InformationViewCell.self, forCellReuseIdentifier: InformationViewCell.reusableId)
        tableView.register(DescriptionViewCell.self, forCellReuseIdentifier: DescriptionViewCell.reusableId)
        tableView.register(ReviewViewCell.self, forCellReuseIdentifier: ReviewViewCell.reusableId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
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
        
        setUIDetail()
    }
    
    private func setUIDetail() {
        view.backgroundColor = .ebonyClayColor
        
        view.addSubview(headerVStack)
        headerVStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(detailTableView)
        detailTableView.snp.makeConstraints { make in
            make.top.equalTo(headerVStack.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension DetailViewController: PresenterToViewDetailProtocol{
    // TODO: Implement View Output Methods
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        default:
            return 7
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellInformation = tableView.dequeueReusableCell(withIdentifier: InformationViewCell.reusableId, for: indexPath) as! InformationViewCell
            
            return cellInformation
        case 1:
            let cellDescription = tableView.dequeueReusableCell(withIdentifier: DescriptionViewCell.reusableId, for: indexPath) as! DescriptionViewCell
            
            return cellDescription
        default:
            let cellReview = tableView.dequeueReusableCell(withIdentifier: ReviewViewCell.reusableId, for: indexPath) as! ReviewViewCell
            
            return cellReview
        }
    }
}
