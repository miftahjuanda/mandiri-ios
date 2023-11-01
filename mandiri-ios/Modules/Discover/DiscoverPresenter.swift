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
}

extension DiscoverPresenter: InteractorToPresenterDiscoverProtocol {
    
}
