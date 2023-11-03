//
//  DiscoverPresenter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

internal final class DiscoverPresenter: ViewToPresenterDiscoverProtocol {
    // MARK: Properties
    weak var view: PresenterToViewDiscoverProtocol?
    var interactor: PresenterToInteractorDiscoverProtocol?
    var router: PresenterToRouterDiscoverProtocol?
    
    var listDiscover: [Discover] = []
    private var page: Int = 1
    
    func getListDiscover() {
        listDiscover.removeAll()
        view?.resultStatus(.loading)
        interactor?.getListDiscover(page: page)
    }
    
}

extension DiscoverPresenter: InteractorToPresenterDiscoverProtocol {
    func resultListDiscover(discover: DiscoverEntity) {
        listDiscover.append(contentsOf: discover.discover)
        view?.resultStatus(.success)
    }
    
    func resultError(error: RequestError) {
        switch error {
        case .sessionError(let error):
            view?.resultStatus(.failure(error.localizedDescription))
        case .anyError(let string):
            view?.resultStatus(.failure(string))
        }
    }
}
