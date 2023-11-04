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
    
    private var viewState = ViewState()
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
        
        return web
    }()
    private let titleLabel = LabelView(font: .boldSystemFont(ofSize: 18))
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
        
        presenter?.fetchAllEndpoint()
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
        
        view.addSubview(viewState)
        viewState.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func bindData() {
        guard let bindData = presenter?.detailEntity else { return }
        titleLabel.text = bindData.title
        
        if let videoURL = URL(string: bindData.videoEntity.url) {
            let request = URLRequest(url: videoURL)
            webView.load(request)
        }
    }
}

extension DetailViewController: PresenterToViewDetailProtocol{
    // TODO: Implement View Output Methods
    func resultStatus(_ type: ViewStateTypes) {
        switch type {
        case .loading:
            viewState.showState { }
        case .success:
            viewState.isHidden = true
            bindData()
            detailTableView.reloadData()
        case .failure(let string):
            viewState.showState(.result(title: string)) { }
        }
    }
    
    func resultReview(_ type: ViewStateTypes) {
        switch type {
        case .loading:
            viewState.showState { }
        case .success:
            detailTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
        case .failure(let string):
            viewState.showState(.result(title: string)) { }
        }
    }
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
            let data = presenter?.detailEntity.reviewEntity.reviews.count ?? 0
            return data == 0 ? 1 : data
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellInformation = tableView.dequeueReusableCell(withIdentifier: InformationViewCell.reusableId, for: indexPath) as! InformationViewCell
            if let data = presenter?.detailEntity {
                cellInformation.setData(information: data)
            }
            
            return cellInformation
        case 1:
            let cellDescription = tableView.dequeueReusableCell(withIdentifier: DescriptionViewCell.reusableId, for: indexPath) as! DescriptionViewCell
            if let data = presenter?.detailEntity {
                cellDescription.setData(genre: data.genres, description: data.overview)
            }
            
            return cellDescription
        default:
            let cellReview = tableView.dequeueReusableCell(withIdentifier: ReviewViewCell.reusableId, for: indexPath) as! ReviewViewCell
            let data = presenter?.detailEntity.reviewEntity.reviews.count ?? 0
            
            if data == 0 {
                cellReview.setEmptyView()
            } else {
                if let review = presenter?.detailEntity.reviewEntity.reviews[indexPath.row] {
                    cellReview.setData(review: review)
                }
            }
            return cellReview
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let itemsCount = tableView.numberOfRows(inSection: 2)
        
        if indexPath.section == 2 && indexPath.item == itemsCount - 1 && itemsCount != 0 {
            presenter?.getPagiantionReview()
        }
    }
}
