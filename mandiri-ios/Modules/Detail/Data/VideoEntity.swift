//
//  VideoEntity.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 04/11/23.
//

import Foundation

internal struct VideoEntity: Decodable {
    var id: Int = 0
    var type: String = ""
    var site: String = ""
    var url: String = ""
}
