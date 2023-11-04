//
//  DetailRouter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

internal final class DetailRouter: PresenterToRouterDetailProtocol {
    // MARK: Static methods
    static func createModule(id: Int) -> UIViewController {
        
        let viewController = DetailViewController()
        
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor(id: id)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
