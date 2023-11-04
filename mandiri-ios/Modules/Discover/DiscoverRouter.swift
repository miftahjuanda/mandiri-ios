//
//  DiscoverRouter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

internal final class DiscoverRouter: PresenterToRouterDiscoverProtocol {
    // MARK: Static methods
    static func createModule(id: Int) -> UIViewController {
        
        let viewController = DiscoverViewController()
        
        let presenter: ViewToPresenterDiscoverProtocol & InteractorToPresenterDiscoverProtocol = DiscoverPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DiscoverRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DiscoverInteractor(id: id)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func navigateToDetail(vc: UIViewController, id: Int) {
        let detailVC = DetailRouter.createModule(id: id)
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
