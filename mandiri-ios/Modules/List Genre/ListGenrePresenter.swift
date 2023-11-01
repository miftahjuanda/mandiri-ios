//
//  ListGenrePresenter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

internal final class ListGenrePresenter: ViewToPresenterListGenreProtocol {

    // MARK: Properties
    weak var view: PresenterToViewListGenreProtocol?
    var interactor: PresenterToInteractorListGenreProtocol?
    var router: PresenterToRouterListGenreProtocol?
}

extension ListGenrePresenter: InteractorToPresenterListGenreProtocol {
    
}
