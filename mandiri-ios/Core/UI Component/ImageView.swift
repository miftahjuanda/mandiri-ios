//
//  ImageView.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//

import UIKit
import SnapKit
import SDWebImage

internal final class ImageView: UIImageView {
    private var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .medium
        indicator.tintColor = .darkGray
        indicator.stopAnimating()
        return indicator
    }()
    
    init() {
        super.init(frame: .zero)
        
        setImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImageView() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
        
        addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func imageWithUrl(with imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        loadingIndicator.startAnimating()
        
        sd_setImage(with: url, placeholderImage: nil, options: [], completed: { [weak self] (_, error, _, _) in
            guard let self = self else { return }
            
            self.loadingIndicator.stopAnimating()
            
            if error != nil {
                self.image = .icDataEmpty
            }
        })
    }
}
