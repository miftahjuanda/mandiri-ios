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
    
    var detailEntity: DetailEntity = .init()
    private var groupQueue = DispatchGroup()
    
    func fetchAllEndpoint() {
        view?.resultStatus(.loading)
        
        getDetail()
        getVideo()
        getReview()
        
        groupQueue.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.view?.resultStatus(.success)
        }
    }
    
    private func getDetail() {
        groupQueue.enter()
        interactor?.getDetail()
    }
    
    private func getVideo() {
        groupQueue.enter()
        interactor?.getVideo()
    }
    
    private func getReview() {
        groupQueue.enter()
        interactor?.getReview()
    }
    
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func resultDetail(detail: DetailEntity) {
        detailEntity = detail
        groupQueue.leave()
    }
    
    func resultVideo(video: VideoEntity) {
        detailEntity.videoEntity = video
        groupQueue.leave()
    }
    
    func resultReview(review: ReviewEntity) {
        detailEntity.reviewEntity = review
        groupQueue.leave()
    }
    
    func resultError(error: RequestError) {
        if case .sessionError(let error) = error {
            view?.resultStatus(.failure(error.localizedDescription))
        } else if case .anyError(let string) = error {
            view?.resultStatus(.failure(string))
        }
        groupQueue.leave()
    }
}
