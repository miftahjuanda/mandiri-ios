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
    }
    
}

extension DiscoverViewController: PresenterToViewDiscoverProtocol{
    // TODO: Implement View Output Methods
}

extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverViewCell.reusableId, for: indexPath) as? DiscoverViewCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}
