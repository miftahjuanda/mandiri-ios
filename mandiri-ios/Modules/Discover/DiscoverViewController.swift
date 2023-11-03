//
//  DiscoverViewController.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

internal final class DiscoverViewController: UIViewController {
    // MARK: - Properties
    weak var presenter: ViewToPresenterDiscoverProtocol?
    
    private var viewState = ViewState()
    private lazy var discoverCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width/2) - 12,
                                 height: view.frame.width/1.6)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 7
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(DiscoverViewCell.self,
                                forCellWithReuseIdentifier: DiscoverViewCell.reusableId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUiDiscover()
        presenter?.getListDiscover()
    }
    
    private func setUiDiscover() {
        title = "Discover"
        view.backgroundColor = .ebonyClayColor
        
        view.addSubview(discoverCollectionView)
        discoverCollectionView.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(7)
            make.bottom.equalToSuperview()
        })
        
        view.addSubview(viewState)
        viewState.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview()
        }
    }
    
}

extension DiscoverViewController: PresenterToViewDiscoverProtocol{
    // TODO: Implement View Output Methods
    func resultStatus(_ type: ViewStateTypes) {
        switch type {
        case .loading:
            viewState.showState { }
        case .success:
            viewState.isHidden = true
            discoverCollectionView.reloadData()
        case .failure(let string):
            viewState.showState(.result(title: string)) { }
        }
    }
}

extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.listDiscover.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverViewCell.reusableId, for: indexPath) as? DiscoverViewCell, let data = presenter?.listDiscover[indexPath.row] {
            cell.setData(data)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let itemsCount = collectionView.numberOfItems(inSection: indexPath.section)
        
        if indexPath.row == itemsCount - 1 {
            presenter?.getPagination()
        }
    }
    
}
