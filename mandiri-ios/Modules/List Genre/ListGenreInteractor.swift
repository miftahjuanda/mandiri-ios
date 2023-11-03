//
//  ListGenreInteractor.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

internal final class ListGenreInteractor: PresenterToInteractorListGenreProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterListGenreProtocol?
    
    func getListGenre() {
        AlamofireHttpClient().request(url: GenreRequest(), completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                if !success.isEmpty {
                    self.presenter?.resultListGenre(genre: success)
                } else {
                    self.presenter?.resultError(error: RequestError.anyError("Data Empty!"))
                }
            case .failure(let failure):
                self.presenter?.resultError(error: failure)
            }
        })
    }
}
