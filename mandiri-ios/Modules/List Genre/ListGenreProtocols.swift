//
//  ListGenreProtocols.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewListGenreProtocol: AnyObject {
    func resultStatus(_ type: ViewStateTypes)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterListGenreProtocol: AnyObject {
    var view: PresenterToViewListGenreProtocol? { get set }
    var interactor: PresenterToInteractorListGenreProtocol? { get set }
    var router: PresenterToRouterListGenreProtocol? { get set }
    
    var resultGenre: [GenreEntity] { get }

    func getListGenre()
    func navigateToDiscover(vc: UIViewController, id: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorListGenreProtocol {
    var presenter: InteractorToPresenterListGenreProtocol? { get set }
    
    func getListGenre()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterListGenreProtocol {
    func resultListGenre(genre: [GenreEntity])
    func resultError(error: RequestError)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterListGenreProtocol {
    func navigateToDiscover(vc: UIViewController, id: Int)
}
