//
//  ListGenrePresenter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

internal final class ListGenrePresenter: ViewToPresenterListGenreProtocol {
    // MARK: Properties
    weak var view: PresenterToViewListGenreProtocol?
    var interactor: PresenterToInteractorListGenreProtocol?
    var router: PresenterToRouterListGenreProtocol?
    
    var resultGenre: [GenreEntity] = []
    
    func getListGenre() {
        view?.resultStatus(.loading)
        interactor?.getListGenre()
    }
    
    func navigateToDiscover(vc: UIViewController, id: Int) {
        router?.navigateToDiscover(vc: vc, id: id)
    }
}

extension ListGenrePresenter: InteractorToPresenterListGenreProtocol {
    func resultListGenre(genre: [GenreEntity]) {
        resultGenre.append(contentsOf: genre)
        
        view?.resultStatus(.success)
    }
    
    func resultError(error: RequestError) {
        if case .anyError(let err) = error {
            view?.resultStatus(.failure(err))
        } else if case .sessionError(let error) = error {
            view?.resultStatus(.failure(error.localizedDescription))
        }
    }
}
