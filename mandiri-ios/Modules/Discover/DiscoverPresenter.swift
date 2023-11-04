//
//  DiscoverPresenter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import UIKit

internal final class DiscoverPresenter: ViewToPresenterDiscoverProtocol {
    // MARK: Properties
    weak var view: PresenterToViewDiscoverProtocol?
    var interactor: PresenterToInteractorDiscoverProtocol?
    var router: PresenterToRouterDiscoverProtocol?
    
    var listDiscover: [Discover] = []
    private var page: Int = 1
    private var maxPage: Int = 1
    private var isFetching = false
    
    func getListDiscover() {
        listDiscover.removeAll()
        view?.resultStatus(.loading)
        interactor?.getListDiscover(page: page)
    }
    
    func getPagination() {
        if !isFetching {
            interactor?.getListDiscover(page: page)
        }
    }
    
    func navigateToDetail(vc: UIViewController, id: Int) {
        router?.navigateToDetail(vc: vc, id: id)
    }
}

extension DiscoverPresenter: InteractorToPresenterDiscoverProtocol {
    func resultListDiscover(discover: DiscoverEntity) {
        page = discover.page
        maxPage = discover.totalPages
        isFetching = true
        
        if page > maxPage || discover.discover.isEmpty {
            listDiscover.append(contentsOf: [])
            isFetching = false
        } else {
            listDiscover.append(contentsOf: discover.discover)
            
            isFetching = false
            page += 1
        }
        
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
