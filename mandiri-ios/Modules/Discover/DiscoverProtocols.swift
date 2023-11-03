//
//  DiscoverProtocols.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDiscoverProtocol: AnyObject {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDiscoverProtocol: AnyObject {
    
    var view: PresenterToViewDiscoverProtocol? { get set }
    var interactor: PresenterToInteractorDiscoverProtocol? { get set }
    var router: PresenterToRouterDiscoverProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDiscoverProtocol {
    
    var presenter: InteractorToPresenterDiscoverProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDiscoverProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDiscoverProtocol {
    
}
