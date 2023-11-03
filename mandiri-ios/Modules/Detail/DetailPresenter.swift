//
//  DetailPresenter.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

internal final  class DetailPresenter: ViewToPresenterDetailProtocol {
    // MARK: Properties
    weak var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    
}
