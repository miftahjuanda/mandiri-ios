//
//  ViewStateTypes.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

internal enum ViewStateTypes: Equatable {
    case loading
    case success
    case failure(String)
}
