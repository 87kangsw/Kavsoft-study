//
//  ImageModel.swift
//  PinterestMacApp (iOS)
//
//  Created by Kanz on 2020/12/10.
//

import Foundation

struct ImageModel: Codable, Identifiable {
    var id: String
    var author: String
    var width: Int
    var height: Int
    var url: String
    var downLoadURL: String // download_url
    
    var onHover: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case downLoadURL = "download_url"
    }
}
