//
//  DetailInteractor.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

internal final class DetailInteractor: PresenterToInteractorDetailProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterDetailProtocol?
    private var id: Int = 0
    
    init(id: Int) {
        self.id = id
    }
    
    func getDetail() {
        AlamofireHttpClient().request(url: DetailRequest(id: id), completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                presenter?.resultDetail(detail: success)
            case .failure(let failure):
                self.presenter?.resultError(error: failure)
            }
        })
    }
    
    func getVideo() {
        AlamofireHttpClient().request(url: VideoRequest(id: id), completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                presenter?.resultVideo(video: success)
            case .failure(let failure):
                self.presenter?.resultError(error: failure)
            }
        })
    }
    
    func getReview(page: Int) {
        AlamofireHttpClient().request(url: ReviewRequest(id: id, page: page), completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                presenter?.resultReview(review: success)
            case .failure(let failure):
                self.presenter?.resultError(error: failure)
            }
        })
    }
}
