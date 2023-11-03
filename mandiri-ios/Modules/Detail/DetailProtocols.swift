//
//  DetailProtocols.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol: AnyObject {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol: AnyObject {
    
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol {
    
    var presenter: InteractorToPresenterDetailProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol {
    
}
