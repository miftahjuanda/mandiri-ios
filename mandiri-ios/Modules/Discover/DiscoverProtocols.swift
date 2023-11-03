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
    func resultStatus(_ type: ViewStateTypes)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDiscoverProtocol: AnyObject {
    var view: PresenterToViewDiscoverProtocol? { get set }
    var interactor: PresenterToInteractorDiscoverProtocol? { get set }
    var router: PresenterToRouterDiscoverProtocol? { get set }
    
    var listDiscover: [Discover] { get }
    
    func getListDiscover()
    func getPagination()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDiscoverProtocol {
    var presenter: InteractorToPresenterDiscoverProtocol? { get set }
    
    func getListDiscover(page: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDiscoverProtocol {
    func resultListDiscover(discover: DiscoverEntity)
    
    func resultError(error: RequestError)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDiscoverProtocol {
    
}
