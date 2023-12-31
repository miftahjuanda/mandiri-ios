//
//  ListGenreRouter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

internal final class ListGenreRouter: PresenterToRouterListGenreProtocol {
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ListGenreViewController()
        
        let presenter: ViewToPresenterListGenreProtocol & InteractorToPresenterListGenreProtocol = ListGenrePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ListGenreRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ListGenreInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func navigateToDiscover(vc: UIViewController, id: Int) {
        let discoverVC = DiscoverRouter.createModule(id: id)
        vc.navigationController?.pushViewController(discoverVC, animated: true)
    }
}
