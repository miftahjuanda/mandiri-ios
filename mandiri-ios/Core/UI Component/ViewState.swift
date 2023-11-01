//
//  ViewState.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//

import UIKit
import SnapKit

internal final class ViewState: UIView {
    private lazy var backgroundView = StackView{
        activityIndicatorView
        imageView
        titleLabel
        descriptionLabel
    }.customSpacing(4, after: 1)
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let titleLabel = LabelView(textColor: .black,
                                       alignment: .center,
                                       font: .systemFont(ofSize: 13,
                                                         weight: .medium))
    private let descriptionLabel = LabelView(textColor: .black,
                                             alignment: .center,
                                             font: .systemFont(ofSize: 10,
                                                               weight: .regular))
    
    private var activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .medium
        activity.tintColor = .black
        activity.color = .black
        activity.stopAnimating()
        return activity
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    private func setupView() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(40)
            make.centerY.equalToSuperview()
        }
        layoutIfNeeded()
    }
    
    public func showState(_ resultState: ResultStateView = .loading, completion: @escaping () -> Void ) {
        isHidden = false
        switch resultState {
        case .loading:
            activityIndicatorView.startAnimating()
            imageView.image = nil
            titleLabel.text = nil
            descriptionLabel.text = nil
            break
            
        case .result(let title, let subtitle):
            activityIndicatorView.stopAnimating()
            
            imageView.image = UIImage(named: "DataEmptyIcon")
            titleLabel.text = title
            descriptionLabel.text = subtitle
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                completion()
            }
            break
        }
    }
    
    deinit {
        print("~ \(description) has been removed from memory")
    }
    
    public override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        if self.window == nil {
            self.alpha = 0
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.alpha = 1
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

internal enum ResultStateView: Equatable {
    case loading
    case result(title: String,
                subtitle: String = "")
}
