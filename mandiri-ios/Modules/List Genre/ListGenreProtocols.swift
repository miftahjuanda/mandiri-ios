//
//  ListGenreProtocols.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewListGenreProtocol: AnyObject {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterListGenreProtocol: AnyObject {
    
    var view: PresenterToViewListGenreProtocol? { get set }
    var interactor: PresenterToInteractorListGenreProtocol? { get set }
    var router: PresenterToRouterListGenreProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorListGenreProtocol {
    
    var presenter: InteractorToPresenterListGenreProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterListGenreProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterListGenreProtocol {
    
}
