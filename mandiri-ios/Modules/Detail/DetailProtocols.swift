//
//  DetailProtocols.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol: AnyObject {
    func resultStatus(_ type: ViewStateTypes)
    func resultReview(_ type: ViewStateTypes)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol: AnyObject {
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }
    
    var detailEntity: DetailEntity { get }
    
    func fetchAllEndpoint()
    func getPagiantionReview()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol {
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    
    func getDetail()
    func getVideo()
    func getReview(page: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol {
    func resultDetail(detail: DetailEntity)
    func resultVideo(video: VideoEntity)
    func resultReview(review: ReviewEntity)
    
    func resultError(error: RequestError)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol {
    
}
