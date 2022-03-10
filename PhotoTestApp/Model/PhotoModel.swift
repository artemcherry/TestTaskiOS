//
//  PhotoModel.swift
//  PhotoTestApp
//
//  Created by Артем Вишняков on 10.03.2022.
//

import Foundation

struct PhotoModel: Codable {
    let author: String?
    let downloadUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case author
        case downloadUrl = "download_url"
    }
}
