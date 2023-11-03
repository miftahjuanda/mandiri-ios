//
//  DiscoverInteractor.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

internal final class DiscoverInteractor: PresenterToInteractorDiscoverProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterDiscoverProtocol?
    private var id: Int
    init(id: Int) {
        self.id = id
    }
    
    func getListDiscover(page: Int) {
        AlamofireHttpClient().request(url: DiscoverRequest(page: page, id: id), completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                if !success.discover.isEmpty {
                    self.presenter?.resultListDiscover(discover: success)
                } else {
                    self.presenter?.resultError(error: RequestError.anyError("Data Empty!"))
                }
            case .failure(let failure):
                self.presenter?.resultError(error: failure)
            }
        })
    }
}
