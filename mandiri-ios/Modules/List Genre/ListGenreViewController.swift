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
    
    private var viewState = ViewState()
    private lazy var genreTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GenreViewCell.self, forCellReuseIdentifier: GenreViewCell.reusableId)
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
        
        setuiGenre()
        presenter?.getListGenre()
    }
    
    private func setuiGenre() {
        title = "Genre"
        view.backgroundColor = .colorEbonyClay
        
        view.addSubview(genreTableView)
        genreTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        view.addSubview(viewState)
        viewState.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview()
        }
    }
    
}

extension ListGenreViewController: PresenterToViewListGenreProtocol {
    // TODO: Implement View Output Methods
    
    func resultStatus(_ type: ViewStateTypes) {
        switch type {
        case .loading:
            viewState.showState { }
        case .success:
            viewState.isHidden = true
            genreTableView.reloadData()
        case .failure(let string):
            viewState.showState(.result(title: string)) { }
        }
    }
}

extension ListGenreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.resultGenre.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GenreViewCell.reusableId, for: indexPath) as? GenreViewCell, let genre = presenter?.resultGenre[indexPath.row] {
            cell.bindData(title: genre.name)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = presenter?.resultGenre[indexPath.row] else { return }
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.animateSelection { [weak self] in
            guard let self = self else { return }
            self.presenter?.navigateToDiscover(vc: self, id: data.id)
        }
    }
}
