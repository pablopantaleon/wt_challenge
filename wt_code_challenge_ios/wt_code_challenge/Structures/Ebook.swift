//
//  Ebook.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import Foundation

struct Ebook: Decodable, Hashable {
    let title: String?
    let author: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case image = "imageURL"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
